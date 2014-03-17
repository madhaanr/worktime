json.array!(@projects) do |project|
  json.extract! project, :id, :name, :work_hour_budget, :start_time, :end_time
  json.url project_url(project, format: :json)
end
