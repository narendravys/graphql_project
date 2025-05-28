class Book < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :author
end
