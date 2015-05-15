class LawsController < ApplicationController
  def index
    @laws = Law.all
  end

  def new
    @law = Law.new
  end

  def create
    @law = Law.new(law_params)
    if @law.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def destroy
    @law = Law.find(params[:id])
    @law.destroy
    redirect_to :root
  end

  def search
    @laws = Law.search(
      query: {
        multi_match: {
          query: params[:q].to_s,
          fields: ['title', 'content']
        }
      },
      highlight: {
        fields: {
          title: {},
          content: {}
        }
      }
    ).records
  end

  def show
  end

  private
    def law_params
      params.require(:law).permit(:content, :title)
    end
end
