require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @tamagotchis = Tamagotchi.all()
  @users = User.all()
  erb :index
end

post '/users' do
  name = params.fetch("name")
  @user = User.new({:name => name})
  @user.save()
  @users = User.all()
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params.fetch("id"))
  erb :tamagotchis
end

post '/tamagotchis' do
  name = params.fetch("name")
  user_id = params.fetch("user_id")
  tamagotchi = Tamagotchi.new({:name => name, :user_id => user_id})
  tamagotchi.save()
  @user = User.find(user_id)
  erb :tamagotchis
end

get '/tamagotchis/:id' do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  erb :tamagotchi
end

patch '/tamagotchis/feed/:id' do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  @tamagotchi.update({:food_level => @tamagotchi.feed})

  url ="/tamagotchis/" + @tamagotchi.id.to_s
  redirect url
end

patch '/tamagotchis/sleep/:id' do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  @tamagotchi.update({:sleep_level => @tamagotchi.bedtime})

  url ="/tamagotchis/" + @tamagotchi.id.to_s
  redirect url
end

patch '/tamagotchis/play/:id' do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  @tamagotchi.update({:activity_level => @tamagotchi.play})

  url ="/tamagotchis/" + @tamagotchi.id.to_s
  redirect url
end
