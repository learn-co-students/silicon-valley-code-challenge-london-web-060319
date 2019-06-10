class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all    
        @@all
    end

    def self.find_by_founder(founder:)
        @@all.select {|startup| startup.founder == founder}
    end

    def self.domains
        @@all.collect {|startup| startup.domain}
    end

    def sign_contract(type:, venture_capitalist:, amount:)
       FundingRound.new(startup: self, type: type, amount: amount, venture_capitalist: venture_capitalist)
    end

    def funding_data
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        funding_data.length
    end

    def total_funds
        fund_size = 0
        funding_data.each do |data|
            fund_size += data.amount
        end
        fund_size
    end

    def investors
        funding_data.collect{|data| data.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|data| VentureCapitalist.tres_commas_club.include?(data)}
    end
end
