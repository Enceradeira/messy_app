# frozen_string_literal: true

module Admin
  class ProfileController < Common::ApplicationController
    def show(user_id:)
      @user = User.find(user_id)
      @user = Repository.find_user(user_id)

      render(ProfileView)
    end

    def change_name_to(user_id:, name:)
      change_user(user_id) do |user|
        user.person.person_attributes.build(name:)
      end
    end

    def change_address_to(user_id:, street:, zip:, city:, country:)
      change_user(user_id) do |user|
        user.person.address.address_attributes.build(street:, city:, zip:, country:)
      end
    end

    private

    def change_user(user_id)
      user = User.find(user_id)
      yield(user)

      user.save

      @user = Repository.find_user(user_id)
      render(ProfileView)
    end
  end
end
