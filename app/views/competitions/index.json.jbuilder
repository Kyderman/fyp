json.array!(@competitions) do |competition|
  json.extract! competition, :id, :name, :sport_id, :competition_format_id, :competition_format_type
  json.url competition_url(competition, format: :json)
end
