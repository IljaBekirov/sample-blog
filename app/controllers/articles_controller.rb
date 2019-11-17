class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @articles = Article.order('created_at DESC').all
  end

  def show
    @article = Article.find(params[:id])
    # @users = User.all
    # @users = User.where(username: @article.author).first
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render action: 'new' # new_contacts_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render action: 'edit' # new_contacts_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :author)
  end
end
