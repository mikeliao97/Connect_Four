require_relative "../lib/connect_four.rb"

puts "Welcome to Connect Four"
bob = ConnectFour::Player.new({color: "X", name: "bob"})
frank = ConnectFour::Player.new({color: "O", name: "frank"})

players = [bob, frank]
ConnectFour::Game.new(players).play
