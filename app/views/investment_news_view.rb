# frozen_string_literal: true

class InvestmentNewsView < View
  def title
    name = @user.person.person_attributes.where(valid_from: ..Date.today).order(valid_from: :asc).last.name
    "#{name}'s news"
  end

  def content = @news
end
