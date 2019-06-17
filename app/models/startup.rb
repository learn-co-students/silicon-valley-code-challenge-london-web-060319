require 'pry'


class Startup

    attr_reader :founder, :domain
    attr_accessor :name, :funding_rounds
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        # @funding_rounds = [] #### NO USE SST
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end
                                        
    def sign_contract(venture_capitalist, type, investment)
        funding_round = FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def funding_rounds   
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.count
    end
        
    def total_funds  #funding_rounds.sum(&:investment) invest is variable iterating
        self.funding_rounds.reduce(0) {|sum, funding_round| sum + funding_round.investment}
    end

    def investors
        self.funding_rounds.map {|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors 
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
    end

end
