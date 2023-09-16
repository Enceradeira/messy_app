# frozen_string_literal: true

module Admin
  class Repository
    UserDTO = Data.define(:id, :name, :country)

    private_constant :UserDTO

    class << self
      def seed_data
        User.create(email: 'admin@messy.com', password: '&£78fsasd', is_admin: true, person_id: nil)
      end

      def find_user(user_id)
        user = User.includes(person: :address).find(user_id)
        UserDTO.new(id: user_id, name: user.person.name, country: user.person.address.country)
      end
    end
  end
end
