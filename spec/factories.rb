FactoryGirl.define do

  factory :project do
    name "Work time"
    work_hour_budget 10
    start_time Date.new(2013,12,3)
    end_time  Date.new(2014,5,4)
  end

  factory :task do
    name "Make Coffee"
    hour_budget 5
    project_id 1
  end

  factory :user do
    username "Arto"
    password "1QWE"
    password_confirmation "1QWE"
  end

  factory :user2, class: User do
    username "Martta"
    password "1QWErty"
    password_confirmation "1QWErty"
  end

  factory :user3, class: User do
    username "Marko"
    password "1QWErty"
    password_confirmation "1QWErty"
    admin 'true'
  end

end