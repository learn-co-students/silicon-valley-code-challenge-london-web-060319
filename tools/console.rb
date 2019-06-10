require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#startup
uber = Startup.new("Uber", "Tom", "Taxi")
twitter = Startup.new("Twitter", "Dick", "Blog")
airbnb = Startup.new("AirBnb", "Harry", "Hotel")

#vc
bill = VentureCapitalist.new("Bill", 3000000000)
warren = VentureCapitalist.new("Warren", 900000000)
jeff = VentureCapitalist.new("jeff", 1500000000)

#funding
uberbill = FundingRound.new(uber, bill, "angel", 2000000)
twitterbill = FundingRound.new(twitter, bill, "angel", 3000000)
airbnbbill = FundingRound.new(airbnb, bill, "angel", 4000000)
twitterwarren = FundingRound.new(twitter, warren, "seed", 1000000)
uberwarren = FundingRound.new(uber, warren, "seed", 700000)
airbnbwarren = FundingRound.new(airbnb, warren, "seed", 500000)
airbnbjeff = FundingRound.new(airbnb, jeff, "angel", 5000000)
uberjeff = FundingRound.new(uber, jeff, "seed", 5000000)
twitterjeff = FundingRound.new(twitter, jeff, "seed", 5000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line