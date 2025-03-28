module Types
  class ModifierType < BaseObject
    field :id, ID, null: false
    field :display_order, Integer, null: true
    field :default_quantity, Integer, null: true
    field :price_override, Float, null: false 
  end
end
