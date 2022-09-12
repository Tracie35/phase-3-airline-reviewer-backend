class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # before do
  #   request.body.rewind
  #   @request_payload = JSON.parse request.body.read
  # end
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/airlines' do
    all_airlines = Airline.all
    all_airlines.to_json
  end

  get '/airlines/:id' do
    airline = Airline.find(params[:id])
    airline.to_json
  end

  put '/airlines/:id' do
    airline = Airline.find_by(id: params[:id])

    airline.update(name: @request_payload.name, image_url: @request_payload.image_url)

    airline.to_json
  end

  delete '/airlines/:id' do
    all_airlines = Airline.all
    all_airlines.destroy
    all_airlines.to_json
  end

  get '/reviews/:id' do
    reviews= Review.all
    reviews.to_json
  end
  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update()
    review.to_json
  end
  post '/airlines:id' do
    airline = Airline.find(params[:id])

    # include associated reviews in the JSON response
    airline.to_json(only: [:id, :name, :slug, :image_url], include: {
      reviews: { only: [:tittle, :description, :score], include: {
        user: { only: [:name] }
      } }
    })
    airline.to_json
  end


 get  '/airlines/:id' do
  airline = Airline.find(params[:id])

  # include associated reviews in the JSON response
  airline.to_json(only: [:id, :name, :slug, :image_url], include: {
    reviews: { only: [:tittle, :description, :score], include: {
      user: { only: [:name] }
    } }
  })
  airline.to_json
  end
end


 

