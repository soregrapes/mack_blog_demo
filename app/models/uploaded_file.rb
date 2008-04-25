class UploadedFile
  include DataMapper::Persistence
  
  property :klass_type, :string
  property :klass_id, :integer
  property :original_file_name, :string
  property :file_type, :string
  property :created_at, :datetime
  
  validates_presence_of :klass_type
  validates_presence_of :klass_id
  validates_presence_of :original_file_name
  validates_presence_of :file_type
  
  def file_path
    "#{self.id}#{self.file_type}"
  end
  
end
