class Startup

  attr_reader :founder, :domain
  attr_accessor :name


  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end


  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder)

  @@all.find{|startup|startup == self}

  end

  def self.domains
    @@all.map{|startup|startup.domain}
  end

  def sign_contract(venture_capitalist, type, investment)

    FundingRound.new(self, venture_capitalist, type, investment)

  end
  # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float),
  # creates a new funding round and
  # associates it with that startup and venture capitalist.

  def funding_round
    FundingRound.all.select{|fund|fund.startup == self}
  end

  def num_funding_rounds
    funding_round.length
  end

  def total_funds
    total_investments = funding_round.map{|fund|fund.investment}
    total_investments.inject(:+)
  end

  def investors
    funding_round.map{|fund|fund.venture_capitalist}.uniq
  end

  def big_investors
    investors.select{|vc|VentureCapiatlist.tres_commas_club.inclue?(vc)}
end

end
