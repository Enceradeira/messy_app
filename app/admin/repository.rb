# frozen_string_literal: true

module Admin
  class Repository
    # A default Admin. Doesn't have a person associated.
    DefaultUserData = Data.define(:id, :email, :admin?)
    # A User or Admin. Does have a person associated.
    UserData = Data.define(:id, :email, :name, :admin?, :street, :zip, :city, :country)
    # A User and its attributes history
    HistoryUserData = Data.define(:email, :history)
    # The Base-Query to fetchint a User with its Person and Address.
    UserDataQuery = User.includes(person: [:person_attributes, { address: :address_attributes }])

    private_constant :UserData, :DefaultUserData, :UserDataQuery, :HistoryUserData

    class << self
      def seed_data
        User.create(email: 'admin@messy.com', password: '&£78fsasd', is_admin: true, person_id: nil)
      end

      def find_user(user_id)
        user = UserDataQuery.find(user_id)
        return nil unless user.present?

        map_user_data(user)
      end

      def find_user_by(**)
        user = UserDataQuery.find_by(**)
        return nil unless user.present?

        map_user_data(user)
      end

      def find_all_users
        UserDataQuery.where.not(person: nil).all.map do |user|
          history = build_person_history(user)

          HistoryUserData.new(email: user.email, history:)
        end
      end

      def passcode_exists?(name:, street:, zip:, city:, country:, passcode:)
        Passcode.exists?(name:, street:, zip:, city:, country:, passcode:)
      end

      private

      def build_person_history(user)
        person = user.person
        person_attributes = person.person_attributes
        address_attributes = person.address.address_attributes

        change_dates = person_attributes.pluck(:created_at) + address_attributes.pluck(:created_at)

        change_dates.sort.map do |date|
          person_attrs = select_attributes_for(person_attributes, date)
          address_attrs = select_attributes_for(address_attributes, date)
          creat_user_data_from_attrs(user, person_attrs, address_attrs)
        end.uniq
      end

      def select_attributes_for(attributes, date)
        attributes.where('created_at <= ?', date).order(id: :desc).first || attributes.first
      end

      def map_user_data(user)
        user.person.present? ? create_user_data(user) : create_default_user_data(user)
      end

      def create_user_data(user)
        person = user.person
        address = person.address
        person_attrs = person.person_attributes.order(id: :desc).first
        address_attrs = address.address_attributes.order(id: :desc).first

        creat_user_data_from_attrs(user, person_attrs, address_attrs)
      end

      def creat_user_data_from_attrs(user, person_attrs, address_attrs)
        UserData.new(id: user.id,
                     email: user.email,
                     admin?: user.admin?,
                     name: person_attrs.name,
                     street: address_attrs.street,
                     zip: address_attrs.zip,
                     city: address_attrs.city,
                     country: address_attrs.country)
      end

      def create_default_user_data(user)
        DefaultUserData.new(id: user.id,
                            email: user.email,
                            admin?: user.admin?)
      end
    end
  end
end
