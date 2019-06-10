require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


magicleap = Startup.new("Magic Leap", "Le H", "www.magicleap.com")
wework = Startup.new("WeWork", "Micheal", "www.wework.com")


hsbc = VentureCapitalist.new("HSBC", 300000)
natwest = VentureCapitalist.new("Natwest", 8000000000)
loyds = VentureCapitalist.new("Loyds", 25000000000)

wework_funding1 = wework.sign_contract(hsbc, "Angel", 200000)
wework_funding2 = wework.sign_contract(hsbc, "Pre-Seed", 700000)
wework_funding3 = wework.sign_contract(loyds, "Pre-Seed", 8900000)
magicleap_funding1 = magicleap.sign_contract(natwest, "Angel", 500000)
magicleap_funding2 = magicleap.sign_contract(natwest, "Pre-Seed", 900000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line