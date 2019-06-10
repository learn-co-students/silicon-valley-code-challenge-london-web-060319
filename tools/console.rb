require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("name1", "founder1", "domain1")
startup2 = Startup.new("name2", "founder2", "domain2")
startup3 = Startup.new("name3", "founder3", "domain3")
startup4 = Startup.new("name4", "founder4", "domain4")

venturecapitalist1 = VentureCapitalist.new("VC1", 100000)
venturecapitalist2 = VentureCapitalist.new("VC2", 200000)
venturecapitalist3 = VentureCapitalist.new("VC3", 3000000000)
venturecapitalist4 = VentureCapitalist.new("VC4", 200000000)

fundinground1 = FundingRound.new(startup1, venturecapitalist1, "Angel", 10000)
fundinground2 = FundingRound.new(startup2, venturecapitalist2, "Pre-Seed", 100000)
fundinground3 = FundingRound.new(startup3, venturecapitalist3, "Seed", 20000)
fundinground4 = FundingRound.new(startup4, venturecapitalist4, "Series A", 3400000)
fundinground5 = FundingRound.new(startup2, venturecapitalist1, "Series A", 2000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
