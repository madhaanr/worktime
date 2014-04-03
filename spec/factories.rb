FactoryGirl.define do
  factory :project do
    name "Work time"
    work_hour_budget 10
    start_time Date.new(2013,12,3)
    end_time  Date.new(2014,5,4)
  end

end