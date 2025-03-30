module Mutations
  class AddModifierGroupToItem < BaseMutation
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(item_id:, modifier_group_id:)
      item_modifier_group = ItemModifierGroup.create!(
        item_id: item_id,
        modifier_group_id: modifier_group_id,
      )
      { success: true, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, errors: e.record.errors.full_messages }
    rescue ActiveRecord::RecordNotUnique
      { success: false, errors: ["This modifier group is already assigned to the item"] }
    end
  end
end