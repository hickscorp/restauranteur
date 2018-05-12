Rails.application.routes.draw do
  root        'static_pages#index'
  resources   :password_resets
  # Static pages.
  get         '/home'                                 => 'static_pages#index'
  # Templates controller routing.
  match       '/templates/*id'                        => 'templates#serve', :via => :get

  # Diets > Courses nesting.
  get         '/diets'                                => 'static_pages#index'
  get         '/diets/:id'                            => 'static_pages#index'
  get         '/diets/:diet_id/courses/:course_id'    => 'static_pages#index'
  # Meals > Plates nesting.
  get         '/meals'                                => 'static_pages#index'
  get         '/meals/:id'                            => 'static_pages#index'
  get         '/meals/:meal_id/plates/:plate_id'      => 'static_pages#index'

  scope :api do
    # Rewriting of sign-up / sign-in.
    post        '/sessions/signin(.:format)'          => 'sessions#create'
    get         '/sessions/current(.:format)'         => 'sessions#current'
    get         '/sessions/signout(.:format)'         => 'sessions#destroy'

    # User resource.
    resources   :users, only: [ :index, :show, :update ]

    # Component Types resources.
    resources   :component_types, only: [ :index, :show ]

    # Nutrition facts can be retrieved for various objects.
    get '/foods/:id/nutrition_facts'  => 'foods#nutrition_facts'
    get '/meals/:id/nutrition_facts'  => 'meals#nutrition_facts'

    # Foods resources.
    resources   :foods, only: [ :index, :show, :nutrition_facts ] do
      resources :components, only: [ :index, :show ]
    end

    # Course Types resources.
    resources   :course_types, only: [ :index, :show ]

    # Diets > Courses > Constraints resources nesting.
    resources   :diets do
      resources   :courses do
        resources   :constraints
      end
    end

    # Meals > Plates > Ingredients resources nesting.
    resources   :meals do
      resources   :plates do
        resources   :ingredients
      end
    end
  end
end
