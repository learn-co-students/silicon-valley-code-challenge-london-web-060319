class Startup
    attr_accessor(:name)
    attr_reader(:founder, :domain)
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
        "Name changed to #{@name} and domain to #{domain}"
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def sign_contract(venture, type, amount)
        FundingRound.new(venture, self, type, amount)
    end

    def num_funding_rounds
        FundingRound.all.select {|startup| startup.startup == self}.size
    end

    def total_funds
        FundingRound.all.select {|startup| startup.startup == self}.map {|startup| startup.amount}.sum
    end

    def investors
        FundingRound.all.select {|startup| startup.startup == self}.map {|startup| startup.venture.name}.uniq
    end

    def big_investors
        big_guys = VentureCapitalist.tres_commas_club.collect {|investor| investor.name}
        investors.concat(big_guys).select {|big| investors.concat(big_guys).count(big) > 1}.uniq
    end
end
