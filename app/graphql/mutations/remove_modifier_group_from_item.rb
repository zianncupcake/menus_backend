module Mutations
  class RemoveModifierGroupFromItem < BaseMutation
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(item_id:, modifier_group_id:)
      item_modifier_group = ItemModifierGroup.find_by!(
        item_id: item_id,
        modifier_group_id: modifier_group_id,
      )
      
      if item_modifier_group.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: ["Failed to remove modifier group from item"] }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, errors: ["This modifier group is not in the specified item"] }
    end
  end
end

