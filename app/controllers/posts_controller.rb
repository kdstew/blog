class PostsController < ApplicationController
  respond_to :json, :html

  def index
    @posts = Post.all
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Successfully created new post'
    else
      flash[:notice] = 'unable to create new post'
    end
    respond_with @post
  end

  def edit
    @post = Post.find(params[:id])
    respond_with @post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Successfully created new post'
    else
      flash[:notice] = 'unable to create new post'
     end
    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    respond_with @post
  end
end
