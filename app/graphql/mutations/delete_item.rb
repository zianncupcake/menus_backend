module Mutations
  class DeleteItem < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      item = Item.find_by(id: id)
      return { success: false, errors: ["Item not found"] } unless item

      if item.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: item.errors.full_messages }
      end
    end
  end
end