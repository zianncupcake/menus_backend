module Mutations
  class AddSectionToMenu < BaseMutation
    argument :menu_id, ID, required: true
    argument :section_id, ID, required: true
    argument :display_order, Int, required: false, default_value: 0

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(menu_id:, section_id:, display_order:)
      menu_section = MenuSection.create!(
        menu_id: menu_id,
        section_id: section_id,
        display_order: display_order
      )
      { success: true, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, errors: e.record.errors.full_messages }
    rescue ActiveRecord::RecordNotUnique
      { success: false, errors: ["This section is already in the menu"] }
    end
  end
end