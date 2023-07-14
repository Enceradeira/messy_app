# frozen_string_literal: true

class PortfolioController < ApplicationController
  include PortfolioValueSupport

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
    redirect_to('profile/show', user_id:)
  end

  def show_investment_news(user_id:)
    redirect_to('investment_news/show', user_id:)
  end

  def show_investment_fees(user_id:)
    redirect_to('investment_fees/show', user_id:)
  end

  def show_outstandig_fees(**)
    render(NotFoundView)
  end
end
