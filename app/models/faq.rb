class Faq < ApplicationRecord
  has_and_belongs_to_many :posts
  has_many_attached :trix_attachments
end
