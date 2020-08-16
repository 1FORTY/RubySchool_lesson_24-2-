require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

  # Validation for visit.erb
  validate = {
      username: "Введите имя",
      phone: "Введите телефон",
      datetime: "Введите время"
  }

  @error = validate.select {|key,_| params[key] == ""}.values.join(", ")

  if @error != ''
    return erb :visit
  end

	erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}..."

end