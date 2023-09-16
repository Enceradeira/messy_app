# frozen_string_literal: true

module Admin
  class AdminView < View
    # view content
    def title = 'Administrator dashboard'

    def content
      @users.select { _1.person.present? }.map do |user|
        "#{user.email}, #{user.person.name}, #{user.person.address.street}, #{user.person.address.zip} #{user.person.address.city}, #{user.person.address.country}"
      end.join("\n")
    end

    # view input
    delegate :generate_passcode, to: :controller
  end

  private_constant :AdminView
end
