angular.module('Restauranteur.factories').factory(
  'Globals', [
    '$q', '$filter', 'Restangular',
    ($q, $filter, Restangular) ->
      # Current session holder.
      session:
        user:     null
      # Session signin action.
      signin:     (credentials) ->
        d             = $q.defer()
        _this         = @
        (credentials && Restangular.all('sessions').customOperation('post', 'signin', credentials) || Restangular.all('sessions').customOperation('get', 'current') )
          .then( (session) ->
            d.resolve Restangular.restangularizeElement null, _this.session.user=session, 'users' )
          .catch( (err) -> d.reject  err )
        d.promise
      # Session signout action.
      signout:    ->
        @session.user = null
        Restangular.all('sessions').customOperation('get', 'signout')

      selection:
        diet:                     null
        course:                   null
        meal:                     null
        plate:                    null

      # Global caching object.
      cache:                      {}
      # Prefetcher method, uses a path and the cache key for caching results.
      prefetch:                 (path, cacheKey, idize=false) ->
        # If requested key is already in cache, just return it.
        return @cache[cacheKey] if @cache[cacheKey?=path]
        # Loading then caching closure.
        ((cache, key, idize) ->
          Restangular.all(path).getList()
            .then               (objs) ->
              if idize
                (cache["#{key}Idized"]?={})[obj.id] = obj for obj in objs
              cache[key]          = objs
        ) @cache, cacheKey, idize # ... closure is being called here.

      # In charge of prefetching all globally required objects.
      prefetchRequirements:     ->
        _cache = @cache
        $q.all [
          @prefetch   'component_types',  'componentTypes', true
          @prefetch   'course_types',     'courseTypes',    true
        ]

      foodById:                 (id) ->
        cache                     = @cache['foodsIdized'] ?= {}
        cache[id] && $q.when(cache[id]) || cache[id] = Restangular.one('foods', id).get()

      # Prepares restangular for being used accross all the application.
      restangulizeModels:       (Globals) ->
        # This method adds common methods to a specific route.
        addCommonMethods = (route) ->
          Restangular.addElementTransformer route, true, (collection) ->
            # Adds the 'byId' method to all collections.
            collection.byId           = (id) ->
              id = parseInt id
              for obj in @
                return obj if obj.id==id
              return null
            collection

        # =========================== #
        # User model.
        Restangular.extendModel 'users', (model) ->
          model.fullName            = -> "#{@last_name} #{@first_name}"
          model.is                  = (role) -> role in @roles
          model

        # =========================== #
        # Component type model.
        addCommonMethods 'component_types'
        # =========================== #
        # Course type model.
        addCommonMethods 'course_types'
        # Food type model.
        Restangular.extendModel 'foods', (model) ->
          model.components            = ->
            cache = Globals.cache['componentsByFoodId'] ?= {}
            cache[@id] && $q.when(cache[@id]) || cache[@id] = @all('components').getList()
          model

        # =========================== #
        # Diet model.
        addCommonMethods 'diets'
        Restangular.extendModel 'diets', (model) ->
          model.cache                 ?= {}
          model.courses               = -> @cache.courses ?= @all('courses').getList()
          model
        # =========================== #
        # Course model.
        addCommonMethods 'courses'
        Restangular.extendModel 'courses', (model) ->
          model.cache                 ?= {}
          model.type                  = -> @cache.type ?= Globals.cache.courseTypesIdized[@course_type_id]
          model.constraints           = -> @cache.constraints ?= @all('constraints').getList()
          model
        # =========================== #
        # Constraint model.
        addCommonMethods 'constraints'
        Restangular.extendModel 'constraints', (model) ->
          model.cache                 ?= {}
          model.type                  = ->
            @cache.type ?= Globals.cache.componentTypesIdized[@component_type_id]
            @cache.type
          model

        # =========================== #
        # Meal model.
        addCommonMethods 'meals'
        Restangular.extendModel 'meals', (model) ->
          model.cache                 ?= {}
          model.diet                  = -> @cache.meal ?= Restangular.one 'meals', @meal_id
          model.plates                = -> @cache.plates ?= @all('plates').getList()
          model
        # =========================== #
        # Plate model.
        addCommonMethods 'plates'
        Restangular.extendModel 'plates', (model) ->
          model.cache                 ?= {}
          model.type                  = -> @cache.type ?= Globals.cache.courseTypesIdized[@course_type_id]
          model.ingredients           = -> @cache.ingredients ?= @all('ingredients').getList()
          model
        # =========================== #
        # Ingredient model.
        addCommonMethods 'ingredients'
        Restangular.extendCollection 'ingredients', (collection) ->
          # Helper on list of ingredient to get total quantity.
          collection.totalQuantity    = -> @.reduce( ((total, item)->total+item.quantity), 0 )
          # Computes nutrition facts for a list of ingredients.
          collection.nutritionFacts   = ->
            facts     = {}
            facts[k]  = 0.0 for k, v of Globals.componentTypes
            # Processes components from a given food.
            processIngredient = (ingredient) ->
              Restangular.one('foods', ingredient.food_id).all('components').getList().then (components) ->
                quantity        = ingredient.quantity / 100.0
                for component in components
                  typeId          = component.component_type_id
                  facts[typeId]   = (facts[typeId] ||= 0) + ( quantity * component.value )
            $q.all( processIngredient(ingredient) for ingredient in @ ).then -> facts
          collection
  ]
)
