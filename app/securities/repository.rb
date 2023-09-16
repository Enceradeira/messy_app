# frozen_string_literal: true

module Securities
  class Repository
    SecurityData = Data.define(:ticker, :quantity)

    private_constant :SecurityData

    class << self
      def find_securities(user_id)
        securities = Security.where(user_id:)
        securities.map { SecurityData.new(ticker: _1.ticker, quantity: _1.quantity) }
      end
    end
  end
end
