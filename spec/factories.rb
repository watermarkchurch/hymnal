FactoryGirl.define do

  factory :song do
    sequence(:title) { |n| "Song #{n}" }
    scripture "Scripture 3:29"
    copyright_blurb "©2048 Some People\nCCLI# 12345"
  end

  factory :song_section do
    sequence(:title) { |n| "verse #{n}" }
    sequence(:lyrics) { |n| "The ants go marching #{n} by #{n} hurrah, hurrah!" }
    association(:song)
  end

end
