class PostsController < Mack::Controller::Base

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.first(params(:id).to_i)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.first(params(:id).to_i)
  end

  # POST /posts
  def create
    @post = Post.new(params(:post))
    if @post.save
      pp request.file(:post_uppity_file)
      unless request.file(:post_uppity_file).file_name.blank?
        @post.add_uppity_file(request.file(:post_uppity_file))
        @post.reload
      end
      render(:action => "show")
    else
      render(:action => "new")
    end
  end

  # PUT /posts/1
  def update
    @post = Post.first(params(:id).to_i)
    if @post.update_attributes(params(:post))
      redirect_to(posts_show_url(:id => @post))
    else
      render(:action => "edit")
    end
  end

  # DELETE /posts/1
  def delete
    @post = Post.first(params(:id).to_i)
    @post.destroy!
    redirect_to(posts_index_url)
  end
  
  def total_posts
    render(:action => :total_posts, :layout => false)
  end

end
