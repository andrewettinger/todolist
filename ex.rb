require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'Task.rb'

enable(:sessions)

task_array = []

get '/' do
	erb(:todo)
end

post '/' do
	task_array.push(Task.new(params[:task]))
	redirect to('/list')
end

get '/list' do
	@task_array = task_array
	erb(:list)
end

get '/remove' do
	@task_array = task_array
	erb(:remove)
end

post '/remove' do
	@task_array = task_array
	remove = params[:remove]
	@task_array.each do |remove_activity|
		if remove_activity.content == remove
		task_array.delete(remove_activity)
	end
end
	redirect to '/list'
end