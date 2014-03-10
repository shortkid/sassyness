# myapp.rb
require 'bundler'
Bundler.require(:default)


configure do

  ##Compass CSS/SASS stuff below
  Compass.configuration do |config|
     config.project_path = File.dirname(__FILE__)
     config.sass_dir = 'views/stylesheets'
     config.output_style = :nested 
  end


  set :haml, { :format => :html5 }
  set :scss, Compass.sass_engine_options
  set :sass, Compass.sass_engine_options


end

    get '/' do
	haml :index
    end

    get '/css/scss/*.css' do
        filename = params[:splat].first
        scss filename.to_sym
    end

    get '/css/prod/*.css' do
        filename = params[:splat].first
        scss filename.to_sym, { :style => :compressed }
    end

    get '/css/sass/*.css' do
        filename = params[:splat].first
        sass filename.to_sym
    end
