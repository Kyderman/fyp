json.array!(@scores) do |score|
  json.extract! score, :id, :team_id, :fixture_id
  json.url score_url(score, format: :json)
end
