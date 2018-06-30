titles = ["Wazzzup People", "Howdy all me peeps!", "this is the time to rock $15"]

3.times do |i|
  Blog.create!(title: titles[i], body: "Just blank text.")
end

3.times do |i|
  Topic.create!(title: titles[i])
end
