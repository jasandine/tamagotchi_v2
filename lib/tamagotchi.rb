class Tamagotchi < ActiveRecord::Base


belongs_to(:user)
before_create(:initial_levels)



define_method(:is_alive) do
  if self.food_level > 1
    true
  else
    false
  end
end

define_method(:set_food_level) do |level|
  self.food_level = level
end

define_method(:feed) do
  self.food_level = self.food_level + 3
end

define_method(:play) do
  self.activity_level = self.activity_level + 3
end


define_method(:bedtime) do
  self.sleep_level = self.sleep_level + 3
end

define_method(:check) do
  stats = []
  stats.push(self.name)
  stats.push(self.food_level)
  stats.push(self.sleep_level)
  stats.push(self.activity_level)
  stats
end

define_method(:time_passes) do
  self.food_level = self.food_level - 2
  self.sleep_level = self.sleep_level - 2
  self.activity_level = self.activity_level - 2
  self.save
end


private


define_method(:initial_levels) do
  self.sleep_level = 10
  self.food_level = 10
  self.activity_level = 10
end

end
