# frozen_string_literal: true

class ProfileView < View
  def title = "#{@user.person.name}'s profile"

  def content
    person = @user.person
    address = person.address
    <<~PROFILE
      Name: #{person.name}
      EMail: #{@user.email}
      Address: #{address.street}, #{address.zip} #{address.city}
      Country: #{address.country}
    PROFILE
  end

  def change_name_to(name)
    controller.change_name_to(user_id: @user.id, name:)
  end

  def change_address_to(street:, zip:, city:, country:)
    controller.change_address_to(user_id: @user.id, street:, zip:, city:, country:)
  end
end
