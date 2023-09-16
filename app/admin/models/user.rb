# frozen_string_literal: true

module Admin
  class User < ActiveRecord::Base
    belongs_to :person, autosave: true
    has_many :securities

    def admin? = is_admin
  end

  private_constant :User
end
