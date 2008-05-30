class PostedFile
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :post_id, Integer
  property :original_file_name, String
  property :file_type, String
  property :created_at, DateTime
  
  validates_present :post_id
  validates_present :original_file_name
  validates_present :file_type
  
  before :destroy, :delete_file
  
  def file_path
    "#{self.id}#{self.file_type}"
  end
  
  UPLOAD_PATH = File.join(Mack::Configuration.public_directory, "uploads")
  
  private
  def delete_file
    FileUtils.rm(File.join(UPLOAD_PATH, self.file_path))
  end
  
end
