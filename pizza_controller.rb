require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza')


get '/pizzas' do
  @pizzas = Pizza.all()
  erb ( :index )
end

# New should go before show because :id can be 1 or 'new' or anything
get '/pizzas/new' do
  @pizza = Pizza.new(params)
  erb ( :new )
end

get '/pizzas/:id' do
  @pizza = Pizza.find(params['id'])
  erb ( :show )
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params['id'])
  erb ( :edit )
end

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb ( :update )
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params['id'])
  @pizza.delete()
  erb ( :delete )
end

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb ( :create )
end
