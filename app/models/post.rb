class Post < ApplicationRecord

    has_one_attached :image
    belongs_to :user
    has_one :count

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :month
end
