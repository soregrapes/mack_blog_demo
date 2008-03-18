class Post < DataMapper::Base
  property :title, :string
  property :email, :string
  property :body, :text
  property :created_at, :datetime
  property :updated_at, :datetime
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :email
end