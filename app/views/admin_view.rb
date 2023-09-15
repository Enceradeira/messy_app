# frozen_string_literal: true

class AdminView < View
  # view content
  def title = 'Administrator dashboard'

  def content
    @users.select { _1.person.present? }.map do |user|
      person = user.person
      person_attributes = person.person_attributes
      address_attributes = person.address.address_attributes

      heading = ["#{user.email}:"]

      change_dates = person_attributes.pluck(:created_at) + address_attributes.pluck(:created_at)
      detail_lines = change_dates.sort.map do |date|
        person_attrs = person_attributes.where('created_at <= ?',
                                               date).order(id: :desc).first || person_attributes.first
        address_attrs = address_attributes.where('created_at <= ?',
                                                 date).order(id: :desc).first || address_attributes.first

        "  #{person_attrs.name}, #{address_attrs.street}, #{address_attrs.zip} #{address_attrs.city}, #{address_attrs.country}"
      end

      (heading + detail_lines).uniq.join("\n")
    end.join("\n")
  end

  # view input
  delegate :generate_passcode, to: :controller
end
