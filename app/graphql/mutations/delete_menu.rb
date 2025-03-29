module Mutations
  class DeleteMenu < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      menu = Menu.find_by(id: id)
      
      if menu.nil?
        { success: false, errors: ["Menu not found"] }
      elsif menu.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: menu.errors.full_messages }
      end
    end
  end
end