class UploadsController < Mack::Controller::Base

 def create
   @my_new_file = request.file(:my_new_file)
   @my_new_file.save_to([MACK_PUBLIC, "uploaded_files", @my_new_file.file_name])
 end

 def index
  redirect_to(uploads_new_url)
 end

end