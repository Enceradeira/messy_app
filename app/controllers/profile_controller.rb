# frozen_string_literal: true

class ProfileController < ApplicationController
  def show(user_id:)
    @user = User.find(user_id)

    render(ProfileView)
  end

  def change_name_to(user_id:, name:)
    @user = User.find(user_id)

    @user.person.person_attributes.build(name:)
    @user.save

    render(ProfileView)
  end

  def change_address_to(user_id:, street:, zip:, city:, country:)
    @user = User.find(user_id)

    @user.person.address.address_attributes.build(street:, zip:, city:, country:)
    @user.save

    render(ProfileView)
  end
end
