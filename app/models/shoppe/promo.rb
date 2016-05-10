module Shoppe
  # The Shoppe::Country model stores countries which can be used for delivery & billing
  # addresses for orders.
  #
  # You can use the Shoppe::CountryImporter to import a pre-defined list of countries
  # into your database. This automatically happens when you run the 'shoppe:setup'
  # rake task.

  class Promo < ActiveRecord::Base
    self.table_name = 'shoppe_promo'

    validates :title, :discount_type, :discount_value, :usage_limit, :active_start_date, :active_end_date, presence: true
    validates :code, presence: true, uniqueness: true

    scope :active, -> { where("active_start_date <= ? AND active_end_date > ? AND times_used < usage_limit", DateTime.now, DateTime.now) }

    def self.valid_coupon? code
      active.where(code: code).present?
    end

    def redeem_coupon
      update_attributes(times_used: times_used + 1)
    end

    def display_discount_type
      discount_type == "percentage" ? "%" : Shoppe.settings.currency_unit
    end

    def active?
      active_start_date <= DateTime.now && active_end_date > DateTime.now
    end

    def full_name
      title
    end

    def stock_control?
      false
    end

    def sku
      code
    end
end
