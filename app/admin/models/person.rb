# frozen_string_literal: true

module Admin
  class Person < ActiveRecord::Base
    belongs_to :address, autosave: true
    has_many :person_attributes, class_name: 'PersonAttributes', autosave: true
  end

  private_constant :Person
end
