require File.dirname(__FILE__) + '/../test_helper.rb'

class PostsControllerTest < Test::Unit::TestCase
  
  def setup
    Post.create(:title => "My Initial Post", :email => "mark@mackframework.com", :body => "This is my initial post.")
    Post.create(:title => "My Second Post", :email => "mark@mackframework.com", :body => "This is my second post.")
  end
  
  def teardown
    Post.delete_all
  end
  
  def test_index
    get posts_index_url
    assert_response :success
    assert_match "<title>posts: index</title>", response.body
    posts = assigns(:posts)
    assert_not_nil posts
    assert_equal Post.count, posts.size
    posts.each do |post|
      assert_match post.body, response.body
    end
  end
  
  def test_show
    p = Post.find(:first)
    get posts_show_url(:id => p.id)
    assert_response :success
    assert_match "<title>posts: show</title>", response.body
    post = assigns(:post)
    assert_not_nil post
    assert_equal p, post
  end
  
  def test_new
    get posts_new_url
    assert_response :success
    assert_match "<title>posts: new</title>", response.body
    post = assigns(:post)
    assert_not_nil post
    assert_nil post.title
  end
  
  def test_edit
    p = Post.find(:first)
    get posts_edit_url(:id => p.id)
    assert_response :success
    assert_match "<title>posts: edit</title>", response.body
    post = assigns(:post)
    assert_not_nil post
    assert_equal p, post
  end
  
  def test_create
    assert_difference(Post, :count) do
      post posts_create_url, :post => {:title => "My Third Post", :email => "mark@mackframework.com", :body => "This is my third post."}
      assert_response :redirect
      post = assigns(:post)
      assert_not_nil post
      assert_redirected_to posts_show_url(:id => post.id)
      assert_equal "My Third Post", post.title
      assert_not_nil post.created_at
      assert_equal post.created_at.to_s, post.updated_at.to_s
    end
  end
  
  def test_update
    assert_difference(Post, :count, 0) do
      p = Post.find(:first)
      put posts_update_url(:id => p.id), :post => {:title => "My edited initial post"}
      assert_response :redirect
      post = assigns(:post)
      assert_not_nil post
      assert_redirected_to posts_show_url(:id => post.id)
      assert_equal "My edited initial post", post.title
      assert_equal p.email, post.email
      assert_equal p.body, post.body
      assert_not_nil post.created_at
      assert_equal post.created_at.to_s, post.updated_at.to_s
    end
  end
  
  def test_delete
    assert_difference(Post, :count, -1) do
      p = Post.find(:first)
      delete posts_delete_url(:id => p.id)
      assert_response :redirect
      assert_redirected_to posts_index_url
    end
  end
  
end