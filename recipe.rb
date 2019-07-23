class Recipe
  attr_accessor :name, :description, :done, :duration, :level
  def initialize(name, description, done, duration = "", level = "")
    @name = name
    @description = description
    @done = done || false
    @duration = duration
    @level = level
  end

  def done?
    @done
  end

  def mark_done
    @done = true
  end
end
