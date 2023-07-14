# frozen_string_literal: true

class Routes
  PATHS = {
    'portfolio/show' => ->(user_id:) { Securities::PortfolioController.new.show(user_id:) },
    'investment_fees/show' => ->(user_id:) { Securities::InvestmentFeesController.new.show(user_id:) },
    'investment_news/show' => ->(user_id:) { Securities::InvestmentNewsController.new.show(user_id:) },
    'login/show' => -> { Admin::LoginController.new.show },
    'admin/show' => ->(user_id:) { Admin::AdminController.new.show(user_id:) },
    'accounting/show' => -> { Accounting::AccountingController.new.show },
    'profile/show' => ->(user_id:) { Admin::ProfileController.new.show(user_id:) }
  }.freeze
end
