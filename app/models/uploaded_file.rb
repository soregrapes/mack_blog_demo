class UploadedFile
  include DataMapper::Persistence
  
  property :klass_type, :string
  property :klass_id, :integer
  property :original_file_name, :string
  property :file_type, :string
  property :file_path, :string
  property :created_at, :datetime
  
  validates_presence_of :klass_type
  validates_presence_of :klass_id
  validates_presence_of :original_file_name
  validates_presence_of :file_type
  validates_presence_of :file_path
  
end
