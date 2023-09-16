# frozen_string_literal: true

module Admin
  class AdminView < View
    # view content
    def title = 'Administrator dashboard'

    def content
      @users.map do |user|
        heading = ["#{user.email}:"]
        detail_lines = user.history.map do |person|
          "  #{person.name}, #{person.street}, #{person.zip} #{person.city}, #{person.country}"
        end

        (heading + detail_lines).join("\n")
      end.join("\n")
    end

    # view input
    delegate :generate_passcode, :show_outstandig_fees, to: :controller
  end

  private_constant :AdminView
end
