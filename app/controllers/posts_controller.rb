class PostsController < ApplicationController
  def show
    post_get!
  end

  def new
    @post = Post.new
  end

  def edit
    post_get!
  end

  def update
    post_get!
    @post.update(post_params)

    if @post.valid?
      redirect_to @post
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def post_get!
    @post = Post.find(params[:id])
  end
end
