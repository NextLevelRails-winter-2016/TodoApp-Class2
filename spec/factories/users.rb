FactoryGirl.define do
  factory :user do
    firstname {FFaker::Name.first_name}
    lastname {FFaker::Name.last_name}
    email {FFaker::Internet.email}

    after(:build) do |user|
      ["Reply to Zack's email", "Complete Homework", "Learn Rspec"].each do |task|
        user.tasks << FactoryGirl.build(:email,
          name: task,
          user: user
        )
      end
    end
  end
end
