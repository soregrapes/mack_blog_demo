class PostsController < Mack::Controller::Base
  
  def index
    @posts = Post.find(:all)
  end

  def show
    @post = Post.find(params(:id))
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params(:id))
  end

  def create
    @post = Post.new(params(:post))
    if @post.save
      redirect_to(posts_show_url(:id => @post.id))
    else
      render(:action => "new")
    end
  end

  def update
    @post = Post.find(params(:id))
    if @post.update_attributes(params(:post))
      redirect_to(posts_show_url(:id => @post.id))
    else
      render(:action => "edit")
    end
  end

  def delete
    @post = Post.find(params(:id))
    # data_mapper needs a ! after destroy
    @post.destroy!
    redirect_to(posts_index_url)
  end
  
end