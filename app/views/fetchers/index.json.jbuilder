json.array!(@fetchers) do |fetcher|
  json.extract! fetcher, :id, :username
  json.url fetcher_url(fetcher, format: :json)
end
