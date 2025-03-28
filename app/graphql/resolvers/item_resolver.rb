module Resolvers
  class ItemResolver < BaseResolver
    type Types::ItemType, null: true
    description "Find an item by ID with modifier groups + modifier + its items"

    argument :id, ID, required: true

    def resolve(id:)
      Item.includes(
        item_modifier_groups: {
          modifier_group: {
            modifiers: { item: {} } 
          }
        }
      ).find_by(id: id)
    end
  end
end