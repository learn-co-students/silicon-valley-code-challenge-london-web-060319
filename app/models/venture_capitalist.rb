class VentureCapitalist

    attr_accessor :name, :total_worth, :funding_rounds
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
        @funding_rounds = []   ####SINGLE SOURCE
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        new_funding = FundingRound.new(startup, self, type, investment)
        @funding_rounds << new_funding
        startup.funding_rounds << new_funding  ####SINGLE SOURCE
    end

    def funding_rounds  ####SINGLE SOURCE
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self }
    end

    def portfolio
        FundingRound.all.select { |round| round.venture_capitalist == self}.uniq
    end
##########################
    def biggest_investments
        funding_rounds.max_by {|funding_round| funding_round.investment}
    end

    def invested(domain)
        rounds_by_domain = funding_rounds.select { |funding_round| funding_round.startup.domain == domain }
        rounds_by_domain.sum(&:investment)
    end

end
