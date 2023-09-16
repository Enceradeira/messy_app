# frozen_string_literal: true

module Admin
  class LoginController < Common::ApplicationController
    def show
      render(LoginView)
    end

    def login(email:, password:)
      @user = Repository.find_user_by(email:, password:)
      if @user.present?
        redirect(@user)
      else
        @login_failed = true
        render(LoginView)
      end
    end

    def signup(email:, password:, passcode:, name:, street:, zip:, city:, country:) # rubocop:disable Metrics/ParameterLists
      address = Address.new
      address.address_attributes.build(street:, city:, zip:, country:)

      person = Person.new(address:)
      person.person_attributes.build(name:)
      @user = User.new(email:, password:, person:)

      if passcode.present?
        if Repository.passcode_exists?(name:, street:, zip:, city:, country:, passcode: passcode.to_i)
          @user.is_admin = true
          @user.save
        else
          @user = nil
          @passcode_failed = true
        end
      else
        @user.save
      end

      render(SignupResultView)
    end

    def show_profile(user_id:)
      redirect_to(ProfileController, user_id:)
    end

    private

    def redirect(_user)
      if @user.admin?
        redirect_to(AdminController, user_id: @user.id)
      else
        redirect_to(Securities::PortfolioController, user_id: @user.id)
      end
    end
  end
end
