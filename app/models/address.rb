# frozen_string_literal: true

class Address < ActiveRecord::Base
  has_one :person
  has_many :address_attributes, autosave: true
end
