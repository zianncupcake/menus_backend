module Mutations
  class RemoveItemFromSection < BaseMutation
    argument :section_id, ID, required: true
    argument :item_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(section_id:, item_id:)
      section_item = SectionItem.find_by!(
        section_id: section_id,
        item_id: item_id
      )
      
      if section_item.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: ["Failed to remove item from section"] }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, errors: ["Item not found in this section"] }
    end
  end
end