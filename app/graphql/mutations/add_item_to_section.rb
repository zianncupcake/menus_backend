module Mutations
  class AddItemToSection < BaseMutation
    argument :section_id, ID, required: true
    argument :item_id, ID, required: true
    argument :display_order, Int, required: false, default_value: 0

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(section_id:, item_id:, display_order:)
      section_item = SectionItem.create!(
        section_id: section_id,
        item_id: item_id,
        display_order: display_order
      )
      { success: true, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, errors: e.record.errors.full_messages }
    rescue ActiveRecord::RecordNotUnique
      { success: false, errors: ["This item is already in the section"] }
    end
  end
end