# frozen_string_literal: true

module Admin
  class ProfileView < View
    def title = "#{@user.name}'s profile"

    def content
      <<~PROFILE
        Name: #{@user.name}
        EMail: #{@user.email}
        Address: #{@user.street}, #{@user.zip} #{@user.city}
        Country: #{@user.country}
      PROFILE
    end

    def change_name_to(name)
      controller.change_name_to(user_id: @user.id, name:)
    end

    def change_address_to(street:, zip:, city:, country:)
      controller.change_address_to(user_id: @user.id, street:, zip:, city:, country:)
    end
  end

  private_constant :ProfileView
end
