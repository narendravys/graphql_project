module Mutations
  class UpdateBook < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    field :book, Types::BookType, null: false

    def resolve(id:, title: nil, description: nil)
      book = Book.find(id)
      book.update!(title: title, description: description)
      { book: book }
    end
  end
end
