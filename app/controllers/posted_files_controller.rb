class PostedFilesController < Mack::Controller::Base

  # # GET /posted_files
  # def index
  #   @posted_files = PostedFile.find(:all)
  # end
  # 
  # # GET /posted_files/1
  # def show
  #   @uppity_file = PostedFile.find(params(:id))
  # end
  # 
  # # GET /posted_files/new
  # def new
  #   @uppity_file = PostedFile.new
  # end
  # 
  # # GET /posted_files/1/edit
  # def edit
  #   @uppity_file = PostedFile.find(params(:id))
  # end
  # 
  # # POST /posted_files
  # def create
  #   @uppity_file = PostedFile.new(params(:uppity_file))
  #   if @uppity_file.save
  #     redirect_to(posted_files_show_url(:id => @uppity_file.id))
  #   else
  #     render(:action => "new")
  #   end
  # end
  # 
  # # PUT /posted_files/1
  # def update
  #   @uppity_file = PostedFile.find(params(:id))
  #   if @uppity_file.update_attributes(params(:uppity_file))
  #     redirect_to(posted_files_show_url(:id => @uppity_file.id))
  #   else
  #     render(:action => "edit")
  #   end
  # end

  # DELETE /posted_files/1
  def delete
    @uppity_file = PostedFile.find(params(:id))
    @uppity_file.destroy!
    redirect_to(posts_index_url)
  end

end
