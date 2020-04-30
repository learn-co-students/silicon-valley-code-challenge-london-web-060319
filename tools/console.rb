require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new(name: "cool.co", founder: "frank", domain: "coolco.com")
s2 = Startup.new(name: "uncool.co", founder: "fronk", domain: "uncoolco.com")

vc1 = VentureCapitalist.new(name: "Jeff", total_worth: 100000000)
vc2 = VentureCapitalist.new(name: "Jill", total_worth: 1200000000)

s1.sign_contract(type:"angel", venture_capitalist: vc2, amount: 2000)
s1.sign_contract(type:"pre-seed", venture_capitalist: vc2, amount: 5000)
s1.sign_contract(type: "extra cash $$$", venture_capitalist: vc1, amount: 10000)

vc2.offer_contract(startup: s2, type: "some cash", amount: 20)

s1.big_investors
# [#<VentureCapitalist:0x00007ffe66a0c0c8 @name="Jill", @total_worth=1200000000>]
binding.pry




0 #leave this here to ensure binding.pry isn't the last line