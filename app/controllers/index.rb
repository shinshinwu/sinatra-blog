# home page to view all blog entries
get '/' do
  # Look in app/views/index.erb
  @entries = Entry.all
  erb :index
end

get '/entries/new' do
  erb :new
end

# show all entries with defined tags
get '/tags/:tag_id' do
  @filters = Filter.where(tag_id: params[:tag_id])
  @entries = []
  @filters.each do |filter|
    @entries << Entry.find(filter.entry_id)
  end
  erb :index
end

# view specific blog entry
get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end

# Save the new entry and redirect to display the new entry
post '/entries' do
  @new_entry = Entry.create(params[:entry])
  @new_entry.add_tags(params[:tags])

  redirect "/entries/#{@new_entry.id}"
end

# Direct to the edit entry page
get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :edit
end

# Updates the entry and save and redirect to the new version of entry
put '/entries/:id' do
  @edited_entry = Entry.find(params[:id])
  @edited_entry.update(params[:entry])
  @edited_entry.add_tags(params[:tags])

  redirect "entries/#{@edited_entry.id}"
end

# delete the specific entry
delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/'
end

