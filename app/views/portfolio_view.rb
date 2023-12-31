# frozen_string_literal: true

class PortfolioView < View
  # view content
  def title = "#{@user.person.name}'s portfolio"

  def content
    currency = CurrencyHelper.find_currency(@user)
    if @portfolio_value.positive?
      "#{@user.person.name}, your portfolio is worth #{format('%.2f', @portfolio_value)} #{currency}"
    else
      "#{@user.person.name}, your portfolio is worth nothing"
    end
  end

  # view input
  def buy(ticker:, quantity:)
    controller.buy(user_id: @user.id, ticker:, quantity:)
  end

  def show_profile
    controller.show_profile(user_id: @user.id)
  end

  def show_investment_news
    controller.show_investment_news(user_id: @user.id)
  end

  def show_investment_fees
    controller.show_investment_fees(user_id: @user.id)
  end

  def show_outstandig_fees
    controller.show_outstandig_fees(user_id: @user.id)
  end
end
