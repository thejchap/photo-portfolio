class App < Sinatra::Base
  configure do
    hash = JSON.parse File.read('data/photos.json')
    photos = hash['photos'].map { |data| OpenStruct.new data }

    set :photos, photos
  end

  before do
    @photos = settings.photos
  end

  get '/' do
    erb :index
  end

  get '/photo/:slug' do
    @photo = @photos.find { |photo| photo.slug == params[:slug] }

    erb :index
  end
end
