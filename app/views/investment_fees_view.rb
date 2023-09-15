# frozen_string_literal: true

class InvestmentFeesView < View
  def title
    name = @user.person.person_attributes.where(valid_from: ..Date.today).order(valid_from: :asc).last.name
    "#{name}'s fees (in #{currency})"
  end

  def content
    if @fees.positive?
      "Fees: #{format('%.2f', @fees)} #{currency}"
    else
      'there are no fees'
    end
  end

  private

  def currency = CurrencyHelper.find_currency(@user)
end
