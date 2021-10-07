FactoryBot.define do
  factory :song do
    sequence(:title) { |n| "Song #{n}" }
    scripture { "Scripture 3:29" }
    copyright_blurb { "©2048 Some People\nCCLI# 12345" }
  end
end
