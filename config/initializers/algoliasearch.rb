AlgoliaSearch.configuration = { application_id: "MAFFW49EC3", api_key: "fd4c24e52a85c7f5d7a9f67535bbb856" }

Algolia.init :application_id => "MAFFW49EC3", :api_key => "a73b7a698aee6469760342268bc06e70"

# exporting livestream database to Algolia
def load_data_from_database
  records = []
  Livestream.all.each do |stream|
    records << stream
  end
  return records
end

index = Algolia::Index.new("Livestream")
# `load_data_from_database` must return an array of Hash representing your objects
load_data_from_database.each_slice(1000) do |batch|
  index.add_objects(batch)
end

# exporting user database to Algolia
# def load_data_from_database
#   records = []
#   User.all.each do |u|
#     records << u
#   end
#   return records
# end

# index = Algolia::Index.new("User")
# # `load_data_from_database` must return an array of Hash representing your objects
# load_data_from_database.each_slice(1000) do |batch|
#   index.add_objects(batch)
# end
