class Post
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :title, String
  property :email, String
  property :body, Text
  property :created_at, DateTime
  property :updated_at, DateTime
  
  has 0..n, :posted_files
  
  validates_present :title
  validates_present :email
  validates_present :body
  
  def add_posted_file(mack_file)
    if mack_file
      file = PostedFile.create(:post_id => self.id, 
                               :original_file_name => mack_file.file_name, 
                               :file_type => File.extname(mack_file.file_name))
      mack_file.save_to([PostedFile::UPLOAD_PATH, file.file_path])
    end
  end
  
  # def to_param
  #   "#{self.id}-#{self.title.methodize.truncate(50, "")}"
  # end
  
end
