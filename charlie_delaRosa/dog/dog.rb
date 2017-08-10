require_relative 'mammal'

class Dog < Mammal
  def pet
    @health = @health + 5
  end

  def walk
    @health = @health + 1
  end

  def run
    @health = @health + 10
  end

end

myDog = Dog.new

(0..2).each do |i|
  myDog.walk
end

(0..1).each do |i|
  myDog.run
end

myDog.pet

myDog.display_health
