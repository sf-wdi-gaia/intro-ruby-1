# Migration Hell Drills

In this drill, we're going to explore migration hell. Please come along.

The #1 rule of migration hell is this:
##### DON'T MODIFY EXISTING MIGRATIONS

Got it?

Cool.

Let's begin

### Create an app with some migrations

1. Create a new rails app. Make sure to use postgres. You got this one.

1. Add some models
  ```console
  > rails g model recipe name:string instructions:string posted:string
  > rails g model ingredient name:string amount:string
  ```
1. Create a relationship between these models using the [has_and_belongs_to_many](http://guides.rubyonrails.org/association_basics.html#has-and-belongs-to-many-association-reference) shorthand.

  ```console
  > rails g migration create_join_table_ingredients_recipes ingredients recipes
  ```
1. Migrate!

1. Add the relationship in your models:

  ```ruby
  # models/ingredient.rb
  class Ingredient < ActiveRecord::Base
    has_and_belongs_to_many :recipes
  end
  ```

  ```ruby
  # models/recipe.rb
  class Recipe < ActiveRecord::Base
    has_and_belongs_to_many :ingredients
  end
  ```
1. Test out these associations in the rails console.

### Exercises

1. Oops! I forgot that I wanted an `author` attribute on the `recipe` model. **Add this attribute** now keeping in mind the #1 rule of migration hell.

1. Now that I'm thinking about it, I actually don't want that `author` attribute... Sorry. Can you **delete this attribute**?

1. This is really weird. I really didn't think this was going to happen, but I was thinking... shouldn't `instructions` actually be called `steps`? Yeah. That makes more sense to me. **Modify this attribute**.

1. I just realized that I accidentally made the `posted` attribute on recipes a string! This should be a datetime, der. Can you help me out to **change this datatype**?

1. I want a **new table**. Let's call it `comments` and make it a 1:n relationship with `recipes`. K thanks.

1. Blerg I HATE comments. Comments are sooo 2015. **Drop that table**.
