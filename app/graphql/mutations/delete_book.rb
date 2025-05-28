module Mutations
  class DeleteBook < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      book = Book.find_by(id: id)
      if book&.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: ["Book not found or deletion failed."] }
      end
    end
  end
end
