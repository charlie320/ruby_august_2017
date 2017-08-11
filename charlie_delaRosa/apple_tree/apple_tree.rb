class AppleTree
  attr_accessor :age
  attr_reader :height, :apple_count
  def initialize
    @age = 0
    @height = 10
    @apple_count = 0
  end

  def year_gone_by
    @age = @age + 1
    @height = @height * 1.1
    if age < 11 and age > 3
      @apple_count = @apple_count + 2
    end
  end

  def pick_apples
    @apple_count = 0
  end

end

puts "This is the apple_tree.rb file."

appleTree = AppleTree.new
puts appleTree.age
appleTree.year_gone_by
puts appleTree.age
