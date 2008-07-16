class PostedFile
  include DataMapper::Resource
  
  property :id, Serial
  property :post_id, Integer
  property :original_file_name, String, :size => 255
  property :file_type, String, :size => 100
  property :created_at, DateTime
  
  validates_present :post_id
  validates_present :original_file_name
  validates_present :file_type
  
  before :destroy, :delete_file
  
  def file_path
    "#{self.id}#{self.file_type}"
  end
  
  UPLOAD_PATH = Mack::Paths.public("uploads")
  
  private
  def delete_file
    FileUtils.rm(File.join(UPLOAD_PATH, self.file_path))
  end
  
end
