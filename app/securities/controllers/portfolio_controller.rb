# frozen_string_literal: true

module Securities
  class PortfolioController < Common::ApplicationController
    def show(user_id:)
      @user = Admin::Repository.find_user(user_id)
      @portfolio_value = calculate_portfolio_value(@user)

      render(PortfolioView)
    end

    def buy(user_id:, ticker:, quantity:)
      @user = Admin::Repository.find_user(user_id)

      Security.create(ticker:, quantity:, user_id: @user.id)

      @portfolio_value = calculate_portfolio_value(@user)

      render(PortfolioView)
    end

    def show_profile(user_id:)
      redirect_to(Admin::ProfileController, user_id:)
    end

    private

    def calculate_portfolio_value(user)
      securities = Repository.find_securities(user.id)
      dollar_value = securities.sum { StockApi.get_share_price(_1.ticker, Date.today) * _1.quantity }

      rate = CurrencyExchangeApi.find_conversion_rate('USD', CurrencyHelper.find_currency(user.country), Date.today)
      dollar_value * rate
    end
  end
end
