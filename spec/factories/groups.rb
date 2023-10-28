FactoryBot.define do
  factory :group do
    association :author, factory: :user
    name { 'Bike Spends' }
    icon { 'https://i.pravatar.cc/75?img=02%02' }
  end
end
