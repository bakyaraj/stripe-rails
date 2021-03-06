module Stripe
  module Plans
    include ConfigurationBuilder

    configuration_for :plan do
      attr_reader :currency
      attr_accessor :name, :amount, :interval, :interval_count, :trial_period_days

      validates_presence_of :id, :name, :amount
      validates_inclusion_of :interval, :in => %w(week month year), :message => "'%{value}' is not one of 'week', 'month' or 'year'"

      def initialize(*args)
        super(*args)
        @currency = 'usd'
        @interval_count = 1
        @trial_period_days = 0
      end

      def create_options
        {
          :currency => @currency,
          :name => @name,
          :amount => @amount,
          :interval => @interval,
          :interval_count => @interval_count,
          :trial_period_days => @trial_period_days
        }
      end
    end
  end
end
