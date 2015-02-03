require('spec_helper')


describe(Tamagotchi) do

  describe("#initial_levels") do
    it("sets the name and other stats") do
      lil_bro = Tamagotchi.create({:name => "ghostface killah"})
      expect(lil_bro.name()).to(eq("ghostface killah"))
      expect(lil_bro.food_level()).to(eq(10))
      expect(lil_bro.sleep_level()).to(eq(10))
      expect(lil_bro.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      lil_bro = Tamagotchi.create({:name => "ghostface killah"})
      expect(lil_bro.is_alive()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      lil_bro = Tamagotchi.create({:name => "ghostface killah"})
      lil_bro.set_food_level(0)
      expect(lil_bro.is_alive()).to(eq(false))
    end
  end

  describe("#feed") do
    it("raises the food level by 3") do
      lil_bro = Tamagotchi.new({:name => "chris rock", :food_level => 4})
      lil_bro.feed()
      expect(lil_bro.food_level()).to(eq(7))
    end
  end

  describe("#play") do
    it("raises the activity level by 3") do
      lil_bro = Tamagotchi.new({:name => "gza", :activity_level => 4})
      lil_bro.play()
      expect(lil_bro.activity_level()).to(eq(7))
    end
  end

  describe("#bedtime") do
    it("puts this lil bro to sleep") do
      lil_bro = Tamagotchi.new({:name => "joey", :sleep_level => 4})
      lil_bro.bedtime()
      expect(lil_bro.sleep_level()).to(eq(7))
    end
  end

  describe("#check") do
    it("returns lil bro's stats") do
      lil_bro = Tamagotchi.new({:name => "duder", :sleep_level => 10, :food_level => 10, :activity_level => 10})
      expect(lil_bro.check()).to(eq(["duder", 10, 10, 10]))
    end
  end

  describe("#time_passes") do
    it("decreases the amount stats the lil bro has left by 2") do
      lil_bro = Tamagotchi.new({:name =>"bobby boulders", :food_level => 10, :sleep_level => 10, :activity_level => 10})
      lil_bro.time_passes()
      expect(lil_bro.food_level()).to(eq(8))
      expect(lil_bro.sleep_level()).to(eq(8))
      expect(lil_bro.activity_level()).to(eq(8))
    end
  end

end
