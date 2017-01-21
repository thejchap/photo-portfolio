class App < Sinatra::Base
  configure do
    hash = JSON.parse File.read('data/photos.json')
    photos = hash['photos'].map { |data| OpenStruct.new data }

    set :photos, photos
  end

  get '/' do
    @photos = settings.photos

    erb :index
  end
end
