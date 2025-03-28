module Types
  class ItemType < BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :type, String, null: false
    field :modifier, Types::ModifierType, null: true          
    field :modifier_groups, [Types::ModifierGroupType], null: true        
  end
end
