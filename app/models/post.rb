class Post < ActiveRecord::Base
  
  include AASM

  belongs_to :user
  has_many :comments
  has_many :has_categories
  has_many :categories, through: :has_categories

  #attr_reader :categories

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}

  after_create :save_categories

  has_attached_file :cover, styles: { medium: "1280x720", thumb: "400x300" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  scope :publicados, ->{ where(state: "published") }

  scope :ultimos, ->{ order("created_at DESC") }

  def self.publicados
    Post.where(state: "published")
  end

  def categories=(value)
    @categories = value
  end
  
  aasm column: "state" do 
    state :in_draft, initial: true
    state :published

    event :publish do
      transitions from: :in_draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :in_draft
    end
  end

  private

  def save_categories()
    unless @categories.nil?
      @categories.each do |category_id|
        HasCategory.create(category_id: category_id, post_id: self.id)
      end
    end
  end

end
