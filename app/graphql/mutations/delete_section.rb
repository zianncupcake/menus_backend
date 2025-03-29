module Mutations
  class DeleteSection < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      section = Section.find_by(id: id)
      return { success: false, errors: ["Section not found"] } unless section

      if section.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: section.errors.full_messages }
      end
    end
  end
end