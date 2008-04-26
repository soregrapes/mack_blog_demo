class Post
  include DataMapper::Persistence
  
  property :title, :string
  property :email, :string
  property :body, :text
  property :created_at, :datetime
  property :updated_at, :datetime
  
  has_many :uploaded_files, :conditions => ["klass_type = 'post'"], :foreign_key => :klass_id, :dependent => :destroy
  
  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :body
  
  def add_uploaded_file(mack_file)
    if mack_file
      file = UploadedFile.create(:klass_type => 'post', 
                                 :klass_id => self.id, 
                                 :original_file_name => mack_file.file_name, 
                                 :file_type => File.extname(mack_file.file_name))
      mack_file.save_to([UploadedFile::UPLOAD_PATH, file.file_path])
    end
  end
  
end
