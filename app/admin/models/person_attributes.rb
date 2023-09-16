# frozen_string_literal: true

module Admin
  class PersonAttributes < ActiveRecord::Base
    has_many :person_attributes, class_name: 'PersonAttributes', autosave: true
  end

  private_constant :PersonAttributes
end
