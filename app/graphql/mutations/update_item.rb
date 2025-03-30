module Mutations
  class UpdateItem < BaseMutation
    argument :id, ID, required: true
    argument :type, String, required: false
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :description, String, required: false
    argument :price, Float, required: false

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      item = Item.find_by(id: id)
      return { item: nil, errors: ["Item not found"] } unless item

      if item.update(attributes)
        { item: item, errors: [] }
      else
        { item: item, errors: item.errors.full_messages }
      end
    end
  end
end