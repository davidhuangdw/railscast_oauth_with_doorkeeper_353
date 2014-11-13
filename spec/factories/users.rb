FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "#{n}"}
    password '123'
    password_confirmation '123'
  end

end
