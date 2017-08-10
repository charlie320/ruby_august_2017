require_relative 'mammal'

class Lion < Mammal
  def initialize
    @health = 170
  end

  def fly
    @health = @health - 10
  end

  def attack_town
    @health = @health - 50
  end

  def eat_humans
    @health = @health + 20
  end

  def display_health
    puts "This is a lion!"
    super
  end
end

mufasa = Lion.new

(0..2).each do |i|
  mufasa.attack_town
end

(0..1).each do |i|
  mufasa.eat_humans
end

(0..1).each do |i|
  mufasa.fly
end

mufasa.display_health
