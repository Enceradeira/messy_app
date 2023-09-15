# frozen_string_literal: true

class LoginController < ApplicationController
  def show
    render(LoginView)
  end

  def login(email:, password:)
    @user = User.find_by(email:, password:)
    if @user.present?
      redirect(@user)
    else
      @login_failed = true
      render(LoginView)
    end
  end

  def signup(email:, password:, passcode:, name:, street:, zip:, city:, country:) # rubocop:disable Metrics/ParameterLists
    valid_from = Date.today
    address = Address.new
    address.address_attributes.build(street:, city:, zip:, country:, valid_from:)
    person = Person.new(address:)
    person.person_attributes.build(name:, valid_from:)
    @user = User.new(email:, password:, person:)

    if passcode.present?
      passcode = Passcode.find_by(name:, street:, zip:, city:, country:, passcode: passcode.to_i)
      if passcode.present?
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
    redirect_to('profile/show', user_id:)
  end

  private

  def redirect(_user)
    if @user.admin?
      redirect_to('admin/show', user_id: @user.id)
    else
      redirect_to('portfolio/show', user_id: @user.id)
    end
  end
end
