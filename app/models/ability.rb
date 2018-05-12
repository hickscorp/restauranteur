class Ability
  include CanCan::Ability
  def initialize(user)
    special                                   = [ ComponentType, CourseType, Food, Component ]
    diet                                      = [ Diet, Course, Constraint ]
    chef                                      = [ Meal, Plate, Ingredient ]

    if user
      # Default non-admin user abilities.
      can   [ :update ],                      [ User ], id: user.id

      # Admin abilities.
      if user.is? :administrator
        can [ :manage ],                      special + diet + chef
      end
      # Dietitian abilities.
      if user.is? :dietitian
        can [ :manage ],                      diet
      end
      # Chef abilities.
      if user.is? :chef
        can [ :manage ],                      chef
      end
    end

    # Default guest abilities.
    can [ :read ],                            special + diet + chef + [ User ]
  end
end
