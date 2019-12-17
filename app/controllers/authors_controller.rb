class AuthorsController < ApplicationController
  def show
    author_get!
  end

  def new
    @author = Author.new
  end

  def edit
    author_get!
  end

  def update
    author_get!
    @author.update(author_params)

    if @author.valid?
      redirect_to @author
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def author_get!
    @author = Author.find(params[:id])
  end
end
