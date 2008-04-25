class Post
  include DataMapper::Persistence
  
  property :title, :string
  property :email, :string
  property :body, :text
  property :created_at, :datetime
  property :updated_at, :datetime
  
  has_many :uploaded_files, :conditions => ["klass_type = 'post'"], :foreign_key => :klass_id
  
  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :body
  
  before_destroy :delete_uploaded_files
  
  def add_uploaded_file(mack_file)
    if mack_file
      file = UploadedFile.create(:klass_type => 'post', 
                                 :klass_id => self.id, 
                                 :original_file_name => mack_file.file_name, 
                                 :file_type => File.extname(mack_file.file_name))
      mack_file.save_to([UPLOAD_PATH, file.file_path])
    end
  end
  
  private
  def delete_uploaded_files
    self.uploaded_files.each do |file|
      FileUtils.rm(File.join(UPLOAD_PATH, file.file_path))
      file.destroy!
    end
  end
  
  UPLOAD_PATH = File.join(MACK_PUBLIC, "uploads")
  
end
