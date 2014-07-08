json.array!(@destroys) do |destroy|
  json.extract! destroy, :id, :Page
  json.url destroy_url(destroy, format: :json)
end
