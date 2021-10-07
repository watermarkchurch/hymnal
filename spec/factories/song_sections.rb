FactoryBot.define do
  factory :song_section do
    sequence(:title) { |n| "verse #{n}" }
    sequence(:lyrics) { |n| "The ants go marching #{n} by #{n} hurrah, hurrah!" }
    association(:song)
  end
end
