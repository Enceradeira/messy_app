# frozen_string_literal: true

class PortfolioController < ApplicationController
  def show(user_id:)
    @user = User.find(user_id)
    @portfolio_value = calculate_portfolio_value(user: @user)

    render(PortfolioView)
  end

  def buy(user_id:, ticker:, quantity:)
    @user = User.find(user_id)

    Security.create(ticker:, quantity:, user_id: @user.id)

    @portfolio_value = calculate_portfolio_value(user: @user)

    render(PortfolioView)
  end

  def show_profile(user_id:)
    redirect_to(ProfileController, user_id:)
  end

  private

  def calculate_portfolio_value(user:)
    securities = user.securities
    dollar_value = securities.sum { StockApi.get_share_price(_1.ticker, Date.today) * _1.quantity }
    rate = CurrencyExchangeApi.find_conversion_rate('USD', CurrencyHelper.find_currency(user), Date.today)
    dollar_value * rate
  end
end
