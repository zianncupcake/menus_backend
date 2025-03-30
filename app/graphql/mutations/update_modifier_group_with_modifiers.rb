# app/graphql/mutations/update_modifier_group.rb
module Mutations
  class UpdateModifierGroupWithModifiers < BaseMutation
    argument :id, ID, required: true
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :selection_required_min, Integer, required: false
    argument :selection_required_max, Integer, required: false
    argument :modifiers, [Types::ModifierAttributesInput], required: false

    field :modifier_group, Types::ModifierGroupType, null: true
    field :errors, [String], null: false

    def resolve(id:, modifiers: nil, **attributes)
      ActiveRecord::Base.transaction do
        group = ModifierGroup.find(id)
        
        # Update group attributes
        group.update!(attributes) if attributes.any?
        
        # Full replacement of modifiers (if provided)
        if modifiers
          group.modifiers.destroy_all
          modifiers.each do |mod_attrs|
            group.modifiers.create!(mod_attrs.to_h)
          end
        end

        { modifier_group: group.reload, errors: [] }
      end
    rescue ActiveRecord::RecordNotFound => e
      { modifier_group: nil, errors: ["Modifier group not found"] }
    rescue ActiveRecord::RecordInvalid => e
      { modifier_group: nil, errors: e.record.errors.full_messages }
    end
  end
end