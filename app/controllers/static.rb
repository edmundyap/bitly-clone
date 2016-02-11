get '/' do #'/' is the same as localhost:9393/
  # @title = "This is title" #if you want to pass between controller to view, you need @variable.
  # @error = "dsad"
  @error = params[:error]
  @all_url = Url.all
  erb :"static/index"
end

post '/urls' do
  new_url = Url.new(long_url: params[:long_url])
  if new_url.save # prompting it to go through the validation
    new_url.shorten
    new_url.to_json
  else
    @msg = "invalid URL"
    
  end

end

get '/:short_url' do


  url = Url.find_by(short_url: params[:short_url]) # find it out with params

  unless url.nil? #when its not nil, means its found, means its valid url
    url.click_count += 1 #raise the click count
    url.save

    redirect url['long_url']
  else
    redirect '/'
  end

end

post '/:id/delete' do
  url = Url.find(params[:id])
    url.destroy
end

#param is a hash that contains everything you passed in to the controller (form).
#key is the long url, value is the things you passed in to the form.
#allows me to use @title in static/index