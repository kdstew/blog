class CommentsController < ApplicationController
  respond_to :json, :html

  def index
    @comments = Comment.all
    respond_with @comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    respond_with @comment
  end

  def create
    @comment = Comment.create(:comment => params[:comment][:comment], :post_id => params[:post_id])
     if @comment.save
      flash[:notice] = 'Successfully created new comment'
      redirect_to posts_path
    else
      flash[:notice] = 'unable to create new comment'
      render :edit
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Successfully created new comment'
    else
      flash[:notice] = 'unable to create new comment'
     end
    respond_with @comment
  end

  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_with @comments
  end

end
