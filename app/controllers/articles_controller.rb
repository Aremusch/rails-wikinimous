class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article_details = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    # @article.destroy
    # redirect_to articles_url, status: :see_other
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
