class Startup
  attr_reader :name, :founder, :domain
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
    @@all.find {|sup| sup.founder == founder}
  end

  def self.domains
    @@all.map {|sup| sup.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding
    FundingRound.all.select{|fund| fund.startup == self}
  end
  
  def num_funding_rounds
    funding.count
  end

  def total_funds
    big_pot = funding.map {|fund| fund.investment}
    big_pot.inject(0, :+)
    # funding.sum(&:investment)
  end

  def investors
    funding.map {|fund| fund.venture_capitalist}.uniq
  end

  def big_investors
    # investors.select {|vc| vc.total_worth > 1000000000}
    investors.select {|vc| VentureCapitalist.tres_commas_club.include?(vc)}
  end

end
