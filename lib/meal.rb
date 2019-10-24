class Meal
  attr_accessor :waiter, :customer, :total, :tip 
  
  @@all = []
  
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
end

  def meals
    Meal.all.select do |meal| 
      meal.waiter == self
    end
  end
  
  def waiters 
    meals.map do |meal|
      meal.waiters
    end
  end
  
  def best_tipper 
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip 
    end
    best_tipped_meal.customer
  end
end