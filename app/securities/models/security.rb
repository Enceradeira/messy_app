# frozen_string_literal: true

module Securities
  class Security < ActiveRecord::Base
    belongs_to :user
  end

  private_constant :Security
end
