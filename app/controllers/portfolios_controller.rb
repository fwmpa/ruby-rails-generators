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
              format.html { redirect_to portfolios_path, notice: "Your portfolio is now live." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
          end
    end


    def portfolio_item_params
        params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end
