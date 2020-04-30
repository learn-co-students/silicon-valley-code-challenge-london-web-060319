class FundingRound

    attr_accessor :type, :amount, :venture_capitalist, :startup

    @@all = []

    def initialize(startup:, type:, amount:, venture_capitalist:)
        @type = type
        @amount = amount.to_f
        @startup = startup
        @venture_capitalist = venture_capitalist
        @@all << self
    end

    def self.all
        @@all
    end

end
