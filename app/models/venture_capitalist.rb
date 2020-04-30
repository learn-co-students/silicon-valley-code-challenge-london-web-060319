class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name:, total_worth:)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|investors| investors.total_worth > 1000000000}
    end

    def offer_contract(startup:, type:, amount:)
        FundingRound.new(startup: startup, type: type, amount: amount, venture_capitalist: self)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.collect{|data| data.startup}.uniq
    end

    def biggest_investment
        investment = 0
        funding_rounds.each do |round|
            investment = round.amount if round.amount > investment
        end
        investment
    end

    def invested(domain:)
        invested = 0
        funding_rounds.each do |data|
            if data.startup.domain == "coolco.com"
                invested += data.amount
            end
        end
        invested
    end

end
