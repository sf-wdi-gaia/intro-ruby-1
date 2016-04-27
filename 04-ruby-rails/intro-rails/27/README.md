## Intro to Rails

| Objectives |
| :--- |
| *Students will be able to:* |
| Articulate the Rails philosophy and the MVC pattern. |
| Start a Rails project with no database and create routes that render dynamic templates. |
| Distinguish between Express and Rails. |

## Philosophy

Rails values...

* **DRYness**: ([from the Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html))
  "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.

* **Separation of Concerns & Modularity**: *writing modular code that focuses on one aspect within the application.* The benefit of this is similar to idea of **compartmentalization** with respect to a production line, which allows for *more rapid development* by being able to **divide and conquer** the construction of a product. It gives us replaceable parts which we can alter individually without breaking other parts.

* **Convention over configuration**: ([from the Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html)) Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify every minutiae through endless configuration files.

## MVC

Rails uses an __MVC__ architecture

<b>M</b>odel - The model refers to the data objects that we use. It's the object oriented approach to design. The data in our database will be the most common type of object that we'll put there.

<b>V</b>iew - The view is the Presentation layer. It's what the user sees and interacts with, essentially the web pages. The HTML, the CSS and the JavaScript. The controller processes and responds to user events, such as clicking on links and submitting forms.

<b>C</b>ontroller - The controller will make decisions based on the request and then control what happens in response. It controls the interaction with our models and with our views.

![MVC Diagram](http://elibildner.files.wordpress.com/2012/06/screen-shot-2012-06-05-at-2-12-18-am.png)

## Railstaurant Metaphor
The **client** is a customer eating in the restaurant, **rails** is the kitchen, the **request** is the food ordered, the **router** is the waiter, the **controller** is a chef, the **model** is a recipe, the **database** is the giant walk-in refrigerator with ingredients, the **view** is plating the dish to look pretty, the **response** with a file is a waiter finally serving the dish to the customer.

## Setup

### How to create a rails project

`rails new NAME_OF_APP`

This will launch a series of exciting events! Rails will construct a project in a directory with the project name that you just gave it. That project will include a standard set of folders and files that every Rails project has. At the end of process, Rails runs `bundle install`. That means Rails has is telling bundler to install all of the gems it will need to run the project.

## Bundler and Gems
Bundler is like NPM. Gems are like node packages from NPM. Any gem you want to use in your project must be listed in your Gemfile (which is like the `package.json` file that NPM used). You have to run `bundle install` anytime you change your Gemfile. Your rails server needs to be restarted after any changes to your Gemfile.

Bundler looks at the `Gemfile` and downloads all of the listed gems in addition to each's dependencies. It then generates a manifest file that is stored in Gemfile.lock. **Never** edit Gemfile.lock!


## Running Rails

- Create a new rails app with `rails new rails-fun --skip-activerecord`
    - the last flag tells the application not use activerecord
    - activerecord is our ORM that manages our Models and our database, we'll learn more about that later
- `cd` into your `rails-fun` folder and run
- run `rails server` or just `rails s` and see what happens
- This will start a server on `localhost:3000` head there and see what it says...

## Rails File Structure

![Rails File Structure](http://i.imgur.com/whOL4DQ.png)

## Routing

Just like we saw before, our project will need to know what actions to take based on which routes a user visits.

- In `config/routes.rb` we write logic to map our paths to controllers we will make.
- Let's say when a user sends a `GET` request to the root route, `/`, we want the `welcome` controller's `index` method to run. In order to do that we could write:

`route.rb`

```ruby
get "/" => "welcome#index"
```

Try saving the file and heading to your root route. What error do you get?

## Controllers

If you did the last step correctly, you should see an error message: `*uninitialized constant WelcomeController*`. This means that we need to create a controller with the name `welcome` as that is where we told our route to go in the first place!

- Run: `rails generate controller welcome`

Reload the page again and find a different error message: `*The action 'index' could not be found for WelcomeController*`. We have created the welcome controller correctly, but there is no `index` method defined. Let's make one:

`welcome_controller.rb`

```ruby
class WelcomeController < ApplicationController
    def index
    end
end
```

Wow, another error! `*Missing template welcome/index...*` Since we have a `welcome` controller and an `index` method, Rails automatically will try to render a view with the path `app/views/welcome/index.html.erb`.  A directory `/welcome` should already exist, it was generated when the welcome controller was generated (thanks rails!). Inside of there add the file `index.html.erb` and inside of the file add some html:

`app/views/welcome/index.html.erb`

```html
<h1>I make internets with Rails</h1>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```
Check out your root route one more time.

## View

- How did a totally empty function cause something to happen? This a case of some Rails magic! The default behavior of a controller's index function is to render the index template.

If you want to be more explicit, you can make our controller better by adding the `render` function with the argument `index`, indicating that's the template we want to render:

`app/controllers/welcome_controller.rb`

```ruby
def index
  render('index')
end
```

Could we point this index function at which ever template we want? Absolutely!

Create a new template with whatever name you like and get it to render on the page.

## ERB (10m)

`.html.erb` files are templates that are processed with embedded ruby, `.erb` to generate an `.html` file. This is known as **server-side templating**. This enables Rails to serve up dynamic views based on the data it is served.

Let's say we want to pass a random number to our view from 0-100... Try adding this to your html:

```html
<h1>I make internets with Rails</h1>
<p>Random number is... <%= Random.new.rand(100) %></p>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```

What's happening here? Ruby is being evaluated first and the result is printed into our html. The `<% %>` symbols escape our html. These act a lot like the `{{}}` handlebars that we used to evaluate JavaScript in our HTML when we were using Angular or Handlebars.

One additional complication that's different from `{{}}`: There are many varieties of `<% %>`.

`<% %>` will *evaluate* the code. It does not leave behind any content on the html template once it's rendered.

`<%= %>` will *interpolate* the result. That is, it will insert the output into the html document.

If you want to run a loop, (imagine an ng-repeat type situation) you would use

```html
<b>Names of all the people</b>
<% @people.each do |person| %>
  Name: <%= person.name %><br/>
<% end %>
```

The statements in the `<% %>` allow us to run some Ruby, the statements in the `<%= %>` leave behind some content that will be viewable in the generated html document.

## Passing Data to our View (10m)

There's certainly some business logic happening in our View. This is bad. Our view should only be concerned with presenting the data, but not actually generating it, that is a violation of **separation of concerns**. To fix this let's move the `Random.new.rand(100)` code to our controller and set that equal to a variable we will pass into our view.

app/controllers/welcome_controller.rb

```ruby
class WelcomeController < ApplicationController
  def index
    @random = Random.new.rand(100)
    render('index')
  end
end
```

Notice we did not create a variable named `random` instead we created an instance variable named `@random`, the **@** is VERY important. Normal variables cannot 'reach' the view, only **instance variables** can reach the view. This is an issue of **scoping**. The **@** puts a variable within a scope that the view can access.

Finally we can refactor the `welcome/index.html.erb` file so that it will use this new variable.

```html
<h1>I make internets with Rails</h1>
<p>Random number is... <%= @random %></p>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```
Wooo, nice!

##Challenge(15m)

* Create a new route: `/about` that with a `GET` request will hit the controller#action `welcome#about`.
* Have `welcome#about` render a view in `welcome/about.html.erb`
* Set a variable equal to your favorite computing language in your `welcome#about` controller, have that variable passed into the view.
* Your view should now display your favorite language!
* Create an array of your favorite languages in your controller. Pass them into your view and put each of them inside its own `<li>` tag. (example: `<li>@languages[0]</li>`)
* Now instead of accessing each element by index, loop over your languages array and display each language.
