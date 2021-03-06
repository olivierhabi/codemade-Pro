class Project < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    has_many :tasks
    
    has_many :subscriptions
    has_many :users, through: :subscriptions

    validates :name, presence: true, length: {maximum: 50}
    validates :content, presence: true, length: {maximum: 500}
    validates :price, presence: true, numericality: {only_integer: true}

    has_attached_file :image, styles: { medium: "680x300>", thumb: "170x75>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def shortname
        name.length > 25? name[0..25] + "..." : name
    end
end
