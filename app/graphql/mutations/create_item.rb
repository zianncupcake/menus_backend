module Mutations
  class CreateItem < BaseMutation
    argument :type, String, required: true
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: true
    argument :price, Float, required: true
    

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      item = Item.new(attributes)

      if item.save
        { item: item, errors: [] }
      else
        { item: nil, errors: item.errors.full_messages }
      end
    end
  end
end