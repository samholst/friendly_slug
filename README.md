# FriendlySlug

Friendly Slug is meant to dynamically create SEO friendly URL links. It is extremely lightweight and non resource intensive. Friendly Slug ties directly into the Rails URL Helpers so you dont 
have to change anything. There is no need to create a Rails Migration as this gem does not add anything to your current database. You must have Active Record in your code base for this to work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'friendly_slug'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install friendly_slug

## Usage

In the model you want to add your slug to, simply put the following code in it:

```ruby
build_friendly_slug :title, :id
```

You will want at least one unique element that you can search by to retrieve a database row. This attribute should also have an index.

For example, if I have a blog post with a `title` and `id`, `id` being a primary key and also an indexed table attribute, my slugged link would look like this:

```ruby
@blog.title = "The Great Friendly Slug"

# views/blogs/index.rb
link_to @blog_post.title, blog_post_path(@blog_post) # => http://localhost:3000/blogs/the-great-friendly-slug-1

# controllers/blogs_controller.rb
def set_blog_post
  @blog_post = Blog.find(params[:id].split("-".last)) # => 1
end
```

In the above example, we will split the `id`, which will end up being `"the-great-friendly-slug-1"`, `1` being the `id` of the actualy blog post, and the preceding setence being the title.

Likewise you could move

```ruby
build_friendly_slug :id, :title
```

the reversed way to have the Friendly Slug be `"1-the-great-friendly-slug"`. It could be whatever you want it to be as you as long as you can search a unique attribute with the slugged text.

Doing it the this way would require you do call `.first` in the controller instead of `.last` in the lookup:

```ruby
# controllers/blogs_controller.rb
def set_blog_post
  @blog_post = Blog.find(params[:id].split("-".first)) # => 1
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/friendly_slug. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FriendlySlug project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/friendly_slug/blob/master/CODE_OF_CONDUCT.md).
