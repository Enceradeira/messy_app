# frozen_string_literal: true

class Routes
  PATHS = {
    'portfolio/show' => ->(user_id:) { PortfolioController.new.show(user_id:) },
    'investment_fees/show' => ->(user_id:) { InvestmentFeesController.new.show(user_id:) },
    'investment_news/show' => ->(user_id:) { InvestmentNewsController.new.show(user_id:) },
    'login/show' => -> { LoginController.new.show },
    'admin/show' => ->(user_id:) { AdminController.new.show(user_id:) },
    'accounting/show' => -> { AccountingController.new.show },
    'profile/show' => ->(user_id:) { ProfileController.new.show(user_id:) }
  }.freeze
end
