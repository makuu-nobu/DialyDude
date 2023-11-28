class Post < ApplicationRecord

    has_one_attached :image
    belongs_to :user
    has_one :count, dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true
    validates :subtitle, presence: true
    validates :content, presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :month_id, numericality: { other_than: 1 }

    def self.ranking
        joins(:count).order('counts.count Desc')
    end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :month
end
