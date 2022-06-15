Money.default_currency = Money::Currency.new("GBP")
Money.locale_backend = :i18n
I18n.config.available_locales = :en
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
