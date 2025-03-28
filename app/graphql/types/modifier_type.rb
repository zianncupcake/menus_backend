module Types
  class ModifierType < BaseObject
    field :id, ID, null: false
    field :display_order, Integer, null: false 
    field :default_quantity, Integer, null: false 
    field :price_override, Float, null: false 
    field :modifier_group, Types::ModifierGroupType, null: false
    field :item, Types::ItemType, null: false
  end
end
