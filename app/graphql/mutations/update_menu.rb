module Mutations
  class UpdateMenu < BaseMutation
    argument :id, ID, required: true

    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :state, String, required: false  
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false


    field :menu, Types::MenuType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      menu = ::Menu.find_by(id: id)
      return { menu: nil, errors: ["Menu not found"] } unless menu

      if menu.update(attributes)
        { menu: menu, errors: [] }
      else
        { menu: nil, errors: menu.errors.full_messages }
      end
    end
  end
end