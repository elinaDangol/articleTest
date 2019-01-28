class ArticlesController < ApplicationController
	def index
		@articles = Article.all

		respond_to do |format|
			format.html
			format.csv { send_data @articles.to_csv }
		end	
	end

	def show
		@article = Article.find(params[:id])
	end
		
	def new
	end
	


	def create
		# render plain: params[:articles].inspect
		# @article = Article.new(params(:article).permit(:title, :text))

		@article = Article.new(article_params)

		@article.save
		redirect_to @article
	end	

	private
		def article_params
			params.require(:article).permit(:title, :text)	
		end	


end
