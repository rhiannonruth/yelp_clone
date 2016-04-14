FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@gmail.com" }
    u.password 'abcdefg123'
    u.password_confirmation 'abcdefg123'
  end

  factory :restaurant do
    name 'GBK'
    description 'Gourmet Burger Kitchen'
  end

  factory :review do
    thoughts 'I think very deeply'
    rating 3
  end

end
