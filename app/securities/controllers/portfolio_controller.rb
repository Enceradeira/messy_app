# frozen_string_literal: true

module Securities
  class PortfolioController < Common::ApplicationController
    def show(user_id:)
      @user = Admin::Service.find_user(user_id)

      @portfolio_value = Service.calculate_portfolio_value(user: @user)

      render(PortfolioView)
    end

    def buy(user_id:, ticker:, quantity:)
      @user = Admin::Service.find_user(user_id)

      Security.create(ticker:, quantity:, user_id: @user.id)

      @portfolio_value = Service.calculate_portfolio_value(user: @user)

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
end
