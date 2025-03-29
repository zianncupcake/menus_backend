module Mutations
  class UpdateSection < BaseMutation
    argument :id, ID, required: true
    argument :label, String, required: false
    argument :description, String, required: false

    field :section, Types::SectionType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      section = Section.find_by(id: id)
      return { section: nil, errors: ["Section not found"] } unless section

      if section.update(attributes)
        { section: section, errors: [] }
      else
        { section: nil, errors: section.errors.full_messages }
      end
    end
  end
end