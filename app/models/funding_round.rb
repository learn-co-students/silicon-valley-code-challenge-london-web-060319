class FundingRound

    attr_reader(:startup, :venture, :type, :amount)

    @@all = []

    def initialize(venture, startup, type, amount)
        
        @venture = venture
        @startup = startup
        @type  = type
        @amount = amount.to_f
        @@all << self
    end

    def self.all
        @@all
    end

end
