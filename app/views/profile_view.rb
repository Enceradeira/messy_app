# frozen_string_literal: true

class ProfileView < View
  def title
    "#{name}'s profile"
  end

  def content
    person = @user.person
    address = person.address.address_attributes
                    .where(valid_from: ..Date.today)
                    .order(valid_from: :desc).first
    <<~PROFILE
      Name: #{name}
      EMail: #{@user.email}
      Address: #{address.street}, #{address.zip} #{address.city}
      Country: #{address.country}
    PROFILE
  end

  def change_name_to(name:, valid_from:)
    controller.change_name_to(user_id: @user.id, name:, valid_from:)
  end

  def change_address_to(street:, zip:, city:, country:, valid_from:)
    controller.change_address_to(user_id: @user.id, street:, zip:, city:, country:, valid_from:)
  end

  def show_portfolio
    controller.show_portfolio(user_id: @user.id)
  end

  def show_investment_news
    controller.show_investment_news(user_id: @user.id)
  end

  def show_investment_fees
    controller.show_investment_fees(user_id: @user.id)
  end

  def name
    @user.person.person_attributes
         .where(valid_from: ..Date.today)
         .order(valid_from: :desc).first.name
  end
end
