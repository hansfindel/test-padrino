task :post_seed => :environment do
  puts Padrino.version
  Post.find_or_create_by({title: "title", body: "post"})

  (2..10000).each do |i|
    p = Post.find_by({title: "Title#{i}", body: "Post#{i}"})  
    if !(p and p.id)
      p = Post.new({title: "Title#{i}", body: "Post#{i}"})
      p.save 
    end
    puts "i = #{i}" if i%250==0
  end
end