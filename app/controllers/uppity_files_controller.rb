class UppityFilesController < Mack::Controller::Base

  # # GET /uppity_files
  # def index
  #   @uppity_files = UppityFile.find(:all)
  # end
  # 
  # # GET /uppity_files/1
  # def show
  #   @uppity_file = UppityFile.find(params(:id))
  # end
  # 
  # # GET /uppity_files/new
  # def new
  #   @uppity_file = UppityFile.new
  # end
  # 
  # # GET /uppity_files/1/edit
  # def edit
  #   @uppity_file = UppityFile.find(params(:id))
  # end
  # 
  # # POST /uppity_files
  # def create
  #   @uppity_file = UppityFile.new(params(:uppity_file))
  #   if @uppity_file.save
  #     redirect_to(uppity_files_show_url(:id => @uppity_file.id))
  #   else
  #     render(:action => "new")
  #   end
  # end
  # 
  # # PUT /uppity_files/1
  # def update
  #   @uppity_file = UppityFile.find(params(:id))
  #   if @uppity_file.update_attributes(params(:uppity_file))
  #     redirect_to(uppity_files_show_url(:id => @uppity_file.id))
  #   else
  #     render(:action => "edit")
  #   end
  # end

  # DELETE /uppity_files/1
  def delete
    @uppity_file = UppityFile.find(params(:id))
    @uppity_file.destroy!
    redirect_to(posts_index_url)
  end

end
