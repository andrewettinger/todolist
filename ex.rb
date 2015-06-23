require 'sinatra'
require 'sinatra/reloader' if development?

enable(:sessions)

get '/' do
	erb(:todo)
end

post '/' do
	@task = params[:task]
	session[:task] = @task
	redirect to('/list')
end

get '/list' do
	"Your tasks are: #{session[:task]}"
end

