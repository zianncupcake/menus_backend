module Types
  class ModifierAttributesInput < Types::BaseInputObject
    argument :item_id, ID, required: true
    argument :display_order, Integer, required: false, default_value: 0
    argument :default_quantity, Integer, required: false, default_value: 0
    argument :price_override, Float, required: false
  end
end