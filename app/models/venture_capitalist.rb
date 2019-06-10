class VentureCapitalist

  attr_accessor :name, :total_worth

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
    @@all.select{|club|club.total_worth>1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(self, startup, type, investment)

  end

  def funding_rounds
    FundingRound.all.select{|fundinground|fundinground.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map{|funding|funding.startup}.uniq
  end

  def biggest_investment
    funding_rounds.map {|largest|largest.investment}.max
  end

  def invested(domain)
    invested = funding_rounds.select{|fundinground|fundinground.startup.domain == domain}
    invested.sum(&:investment)
    # newinvestment = invested.map{|funds|funds.investment}
    # newinvestment.inject(0, :+)

  end
# given a domain string, returns the total amount invested in that domain


end
