# frozen_string_literal: true

class ProfileController < ApplicationController
  def show(user_id:)
    @user = User.find(user_id)

    render(ProfileView)
  end

  def change_name_to(user_id:, name:, valid_from:)
    @user = User.find(user_id)

    @user.person.person_attributes.build(name:, valid_from:)
    @user.save

    render(ProfileView)
  end

  def change_address_to(user_id:, street:, zip:, city:, country:, valid_from:)
    @user = User.find(user_id)

    @user.person.address.address_attributes.build(street:, zip:, city:, country:, valid_from:)
    @user.save

    render(ProfileView)
  end

  def show_portfolio(user_id:)
    redirect_to('portfolio/show', user_id:)
  end

  def show_investment_news(user_id:)
    redirect_to('investment_news/show', user_id:)
  end

  def show_investment_fees(user_id:)
    redirect_to('investment_fees/show', user_id:)
  end
end
