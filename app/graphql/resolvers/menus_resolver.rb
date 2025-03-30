module Resolvers
  class MenusResolver < BaseResolver
    type [Types::MenuType], null: false
    description "List all menus"

    argument :is_active, Boolean, required: false

    def resolve(is_active: nil)
      is_active.nil? ? Menu.all  : Menu.all.where(state: "active")
    end
  end
end