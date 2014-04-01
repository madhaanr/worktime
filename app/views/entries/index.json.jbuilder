json.array!(@entries) do |entry|
  json.extract! entry, :id, :date_when_done, :hours_done, :description, :user_id, :project_id, :task_id
  json.url entry_url(entry, format: :json)
end
