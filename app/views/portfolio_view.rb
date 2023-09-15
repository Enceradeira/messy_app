# frozen_string_literal: true

class PortfolioView < View
  # view content
  def title = "#{@user.person.person_attributes.order(id: :desc).first.name}'s portfolio"

  def content
    currency = CurrencyHelper.find_currency(@user)
    name = @user.person.person_attributes.order(id: :desc).first.name
    if @portfolio_value.positive?
      "#{name}, your portfolio is worth #{format('%.2f', @portfolio_value)} #{currency}"
    else
      "#{name}, your portfolio is worth nothing"
    end
  end

  # view input
  def buy(ticker:, quantity:)
    controller.buy(user_id: @user.id, ticker:, quantity:)
  end

  def show_profile
    controller.show_profile(user_id: @user.id)
  end
end
