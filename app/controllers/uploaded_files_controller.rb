class UploadedFilesController < Mack::Controller::Base

  # GET /uploaded_files
  def index
    @uploaded_files = UploadedFile.find(:all)
  end

  # GET /uploaded_files/1
  def show
    @uploaded_file = UploadedFile.find(params(:id))
  end

  # GET /uploaded_files/new
  def new
    @uploaded_file = UploadedFile.new
  end

  # GET /uploaded_files/1/edit
  def edit
    @uploaded_file = UploadedFile.find(params(:id))
  end

  # POST /uploaded_files
  def create
    @uploaded_file = UploadedFile.new(params(:uploaded_file))
    if @uploaded_file.save
      redirect_to(uploaded_files_show_url(:id => @uploaded_file.id))
    else
      render(:action => "new")
    end
  end

  # PUT /uploaded_files/1
  def update
    @uploaded_file = UploadedFile.find(params(:id))
    if @uploaded_file.update_attributes(params(:uploaded_file))
      redirect_to(uploaded_files_show_url(:id => @uploaded_file.id))
    else
      render(:action => "edit")
    end
  end

  # DELETE /uploaded_files/1
  def delete
    @uploaded_file = UploadedFile.find(params(:id))
    @uploaded_file.destroy!
    redirect_to(uploaded_files_index_url)
  end

end
