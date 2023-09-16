# frozen_string_literal: true

module Admin
  class Address < ActiveRecord::Base
    has_many :address_attributes, class_name: 'AddressAttributes', autosave: true
  end

  private_constant :Address
end
