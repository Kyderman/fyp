json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :competition_id
  json.url fixture_url(fixture, format: :json)
end
