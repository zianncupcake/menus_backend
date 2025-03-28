module Resolvers
  class MenuResolver < BaseResolver
    type Types::MenuType, null: true
    description "Returns a single menu by ID + sections"

    argument :id, ID, required: true

    def resolve(id:)
      Menu.includes(menu_sections: :section)
           .find_by(id: id)
    end
  end
end