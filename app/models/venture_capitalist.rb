class VentureCapitalist
    attr_reader(:name, :total_worth)

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|venture| venture.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(self, startup, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|funding| funding.venture == self}
    end

    def portfolio
    end

    def biggest_investment
        funding_rounds.max_by {|fund| fund.amount}
    end

    def invested(domain)
        binding.pry
        funding_rounds.select {|fund| fund.startup.domain == domain}.sum(&:investment)
    end

end
