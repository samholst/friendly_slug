[![Gem Version](https://badge.fury.io/rb/friendly_slug.svg)](https://badge.fury.io/rb/friendly_slug)
[![Build Status](https://travis-ci.org/samholst/friendly_slug.svg?branch=master)](https://travis-ci.org/samholst/friendly_slug)

# FriendlySlug

Friendly Slug is meant to dynamically create SEO friendly URL links. It is extremely lightweight and non resource intensive. Friendly Slug ties directly into the Rails URL Helpers so you dont 
have to change anything. There is no need to create a Rails Migration as this gem does not add anything to your current database unless you want to use the database option. You must have Active Model in your code base for this to work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'friendly_slug'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install friendly_slug

## Non Database Usage

In the model you want to add your slug to, simply put the following code in it:

```ruby
# models/your_model.rb
build_friendly_slug :title, :id, use: :last
```

You must provide one unique indexed attribute that you can search by to retrieve a database row and one other attribute you want to appear in the URL. The unique attribute key that will be used should not have any spaces or `-` in it. The method accepts as many symbolic chained paramters you need, the **last** or **first** parameter defines where the unique key is in the paramater list that will be looked up.
The algorithm will not work if the unique key is not the first or the last in the last. The only symbols accepted for `use:` in non database usage accepted are `:first` or `:last`. Since our unique id in the example above is in the second parameter spot, we will use `:last`.

For example, if I have a blog post with a `title` and `id`, `id` being a primary key and also an indexed table attribute, my slugged link would look like this:

```ruby
@blog.title = "The Great Friendly Slug"

# views/blogs/index.rb
link_to @blog.title, blog_path(@blog) # => http://localhost:3000/blogs/the-great-friendly-slug-1

# controllers/blogs_controller.rb
def set_blog
  @blog = Blog.find_slugged(params[:id]) # => 1
end
```

In the above example, we will split the `id`, which will end up being `"the-great-friendly-slug-1"`, `1` being the `id` of the actual blog post, and the preceding sentence being the title.

Likewise you could move

```ruby
build_friendly_slug :id, :title, use: :first
```

the reversed way to have the Friendly Slug be `"1-the-great-friendly-slug"`. We then change the `use` to be `:first`, since now our unique key is in the first parameter spot. The attribute can be whatever you want it to be as you as long as you can search a unique attribute with the slugged text.

```ruby
# controllers/blogs_controller.rb
def set_blog
  @blog = Blog.find_slugged(params[:id]) # => 1
end
```

## Database Usage

For the main part, the syntax of the gem remains the same, except for `use:`, you will put `use: :database` and not use `:first` or `:last`. Attributes that are chained on as symbols will construct the entire slug.

For exmaple, you can use as little as one attribute, such as the `title` of the blog post. The model's URL helper methods are dynamically updated as well.

```ruby
# models/your_model.rb
build_friendly_slug :title, use: :database

# views/blogs/index.rb
link_to @blog.title, blog_path(@blog) # => http://localhost:3000/blogs/the-great-friendly-slug
```

or you can chain on attribute symbols to generate a slug with a `:title` and a `:author` (author is not a reference in this scenario):

```ruby
# models/your_model.rb
build_friendly_slug :title, :author, use: :database

# views/blogs/index.rb
link_to @blog.title, blog_path(@blog) # => http://localhost:3000/blogs/the-great-friendly-slug-sam-holst
```

You will need to generate a migration file that adds a slug as type string to your desired model along with it being indexed and unique.

```ruby
# db/migrations/my_migration_file.rb
class AddSlugToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :slug, :string
    add_index :blogs, :slug, unique: true
  end
end
```

After this is run, you'll want to update all of your current model to have a slug. Keep in mind that string database types can only have up to 255 characters.

```ruby
Blog.all.map(&:save)
```

Friendly Slug automatically checks whenever the model is saved/updated to see if the title has changed. If the title has changed, it will update the slug to the newest updated parameter chain you provided in the model.
If the slug already exists in that model's database table, it will append a randomly generated hash to the end of it.

In your controller, you will need to use: 

```ruby
# controllers/blogs_controller.rb
def set_blog
  @blog = Blog.find_by_slug(params[:id]) # => id: "the-great-friendly-slug" => id: 1
end
```

When this is set in your controller, it will find the row with that specific `slug` and return it to you. In this specific case, the post with that `slug` has an `id` of 1. You need to leave `params[:id]` as is. The `id` coming in
is the slugged title, which is then taken by the model's `find_by_slug` class method for the search. The gem's magic allows you to not have to worry about many intricate things such as this.

If you decide to change the format of how your slugs are generated through the `build_friendly_slug` after you have originally created them, you will need to run the following snippet:

```ruby
Blog.all.map{|b| b.slug = nil; b.save}
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
