class CrimeScene
  attr_accessor :x, :y

  def initialize(directions)
    @x, @y = 0, 0
    @orientation, @multiplier = :y, 1
    @directions = directions
    self.calculate_position
  end

  protected

  def calculate_position
    @directions.each do |direction|
      case direction
      when 'forward' then self.forward
      when 'right' then self.right
      when 'left' then self.left
      end
    end
  end

  def right
    @multiplier *= (@orientation == :x ? -1 : 1)
    @orientation = (@orientation == :x ? :y : :x)
  end

  def left
    @multiplier *= (@orientation == :y ? -1 : 1)
    @orientation = (@orientation == :x ? :y : :x)
  end


  def forward
    eval("@#{@orientation} += #{@multiplier}")
  end
end
