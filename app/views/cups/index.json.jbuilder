json.array!(@cups) do |cup|
  json.extract! cup, :id
  json.url cup_url(cup, format: :json)
end
