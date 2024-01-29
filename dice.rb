#/ dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!("0.0.0.0/0.0.0.0")


=begin
get '/' do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end
=end

# DICE GAME

# Home Page
get("/dice") do
  "<h1>Dice Roll</h1>
  <ul>
    <li><a href=/dice/2/6>Roll two 6-sided dice</a></li>
    <li><a href=/dice/2/10>Roll two 10-sided dice</a></li>
    <li><a href=/dice/1/20>Roll one 20-sided die</a></li>
    <li><a href=/dice/5/4>Roll five 4-sided dice</a></li>
    <li><a href=/dice/3/25>Roll three 25-sided dice</a></li>
  </ul>"
end

# Two six-sided dice
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)

  sum = first_die + second_die
  
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end  

# Two ten-sided dice
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)

  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

# One twenty-sided die
get("/dice/1/20") do
  first_die = rand(1..20)

  outcome = "You rolled a #{first_die}"

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

# Five four-sided dice
get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "First you rolled a #{first_die}, then you rolled a #{second_die}, then you rolled a #{third_die}, after that you rolled a #{fourth_die}, and finally you rolled a #{fifth_die} for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end

# Three twenty-five sided dice
get("/dice/3/25") do
  first_die = rand(1..25)
  second_die = rand(1..25)
  third_die = rand(1..25)

  sum = first_die + second_die + third_die

  outcome = "You rolled a #{first_die}, a #{second_die}, and finally a #{third_die} for a total of #{sum}."

  "<h1>3d25</h1>
  <p>#{outcome}</p>"
end
