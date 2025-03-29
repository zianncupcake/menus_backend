module Mutations
  class RemoveSectionFromMenu < BaseMutation
    argument :menu_id, ID, required: true
    argument :section_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(menu_id:, section_id:)
      menu_section = MenuSection.find_by!(
        menu_id: menu_id,
        section_id: section_id
      )
      
      if menu_section.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: ["Failed to remove section from menu"] }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, errors: ["This section is not in the specified menu"] }
    end
  end
end