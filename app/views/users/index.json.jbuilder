json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :photo, :birthday, :latitude, :longitude, :occupation, :field, :orientation, :interest, :physical, :free_time
  json.url user_url(user, format: :json)
end
