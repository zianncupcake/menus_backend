module Mutations
  class CreateModifierGroupWithModifiers < BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :selection_required_min, Integer, required: true
    argument :selection_required_max, Integer, required: true
    argument :modifiers, [Types::ModifierAttributesInput], required: true

    field :modifier_group, Types::ModifierGroupType, null: true
    field :errors, [String], null: false

    def resolve(identifier:, label:, selection_required_min:, selection_required_max:, modifiers:)
      ActiveRecord::Base.transaction do
        # Validate all modifier items are components

        if modifiers.size < selection_required_max
          return {
            modifier_group: nil,
            errors: ["Number of modifiers must be greater than or equal to max number of selected modifiers"]
          }
        end

        modifier_hashes = modifiers.map do |mod|
          {
            item_id: mod[:item_id],
            default_quantity: mod[:default_quantity],
            display_order: mod[:display_order],
            price_override: mod[:price_override]
          }
        end

        # Validate component items
        item_ids = modifier_hashes.map { |m| m[:item_id] }
        invalid_items = Item.where(id: item_ids).where.not("type = ?", "Component")
        
        if invalid_items.any?
          return {
            modifier_group: nil,
            errors: ["These items must be components: #{invalid_items.pluck(:identifier).join(', ')}"]
          }
        end

        # Create modifier group
        group = ModifierGroup.create!(
          identifier: identifier,
          label: label,
          selection_required_min: selection_required_min,
          selection_required_max: selection_required_max
        )


        # Create modifiers
        modifier_hashes.each do |mod_attrs|
          group.modifiers.create!(mod_attrs)
        end

        { modifier_group: group, errors: [] }
      end
    rescue ActiveRecord::RecordInvalid => e
      { modifier_group: nil, errors: e.record.errors.full_messages }
    end
  end
end