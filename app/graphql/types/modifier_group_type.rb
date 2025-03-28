module Types
  class ModifierGroupType < BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :selection_required_min, Integer, null: false
    field :selection_required_max, Integer, null: false
    field :modifiers, [Types::ModifierType], null: true 
    def modifiers
      object.modifiers.order(:display_order)
    end
  end
end
