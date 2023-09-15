# frozen_string_literal: true

class Person < ActiveRecord::Base
  belongs_to :address, autosave: true
  has_one :user
  has_many :person_attributes, autosave: true
end
