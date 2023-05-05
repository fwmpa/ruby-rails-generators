class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    if @portfolio_item.update(portfolio_item_params)
      flash[:success] = 'Portfolio was successfully updated'
      redirect_to portfolios_path
    else
      render 'edit'
    end
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
