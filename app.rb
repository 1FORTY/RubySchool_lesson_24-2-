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

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  @password = params[:pass]
  @email = params[:email]

  validation = {
      password: "Вы не ввели пароль",
      email: "Вы не ввели потовый адрес"
  }

  validation.each do |key, value|
    if params[key] == ''
      @error = value
    end

    if @password.size < 6
      @error = 'Ваш пароль слишком простой'
    elsif !@email.include?('@')
      @error = 'Вы ввели не почту'
    end
  end

  if @error != ''
		return erb :contacts
  end


  erb "Спасибо, мы получили ваши данные. Пароль: #{@password} и почта: #{@email}"
end