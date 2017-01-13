require 'random_data'

Post.find_or_create_by!(
  title: "Unique Post",
  body: "This is my unique post, there is only one, and it is mine."
)

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments

Comment.find_or_create_by!(
  post_id: 1,
  body: "This is the unique comment for my unique post."
)
  
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"