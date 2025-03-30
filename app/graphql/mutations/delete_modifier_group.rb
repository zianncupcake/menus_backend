module Mutations
  class DeleteModifierGroup < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      modifier_group = ModifierGroup.find_by(id: id)
      return { success: false, errors: ["Modifier group not found"] } unless modifier_group

      if modifier_group.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: modifier_group.errors.full_messages }
      end
    end
  end
end