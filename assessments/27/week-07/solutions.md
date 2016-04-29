# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> WDI Week 7 Assessment

**SOLUTIONS**

1. Fill in the hash below with your name and cohort:

  `my_info = { :name => “R. Duck”,   :cohort => 1337 }`

1. In Ruby, declare a variable called `favorite_food`, and set it equal to your favorite food. Then use your `favorite_food` variable to create a string proclaiming your favorite food: "My favorite food is ________." 

  ```ruby
  favorite_food = "bread"
  puts "My favorite food is #{favorite_food}!" 
  # ^ puts part is not required
  ```

1. Write a Ruby regular expression that matches the first digit in a string. For example, your regex should match the `1` in `"Party like it’s 1999!"`


  ```ruby
  regex = /\d/
  ```

1. Write a method called `fastest` that takes a `speeds` array parameter and _both_ prints and returns the fastest speed.  

  > Example Use:      
  ```ruby
  fastest([55, 25, 70, 40])
    70
    => 70
  ```


  ```ruby
  def fastest(speeds)
    p speeds.max
  end
  ```


  **Use the `Pet` class code below to answer the next three questions.**

1. Use each of the following terms (or letters) to label one example of the term in the Pet class:

   a. instance variable			 
   b. class variable    
   c. instance method		 	
   d. class method    
   e. getter					  
   f. setter  

1. Create an instance of the `Pet` class.

  ```ruby
  morocco = Pet.new "Morocco"
  ```


1. Use the `play_with` method on the pet you just created and a toy of `"rope"`.


  ```ruby
  morocco.play_with("rope")
  ```


  ```ruby
  class Pet						
  	attr_accessor :name             # A, C, E, F
  	attr_reader :happiness          # A, C, E

    @@all = []                      # B

  	def initialize(name)            # C
      @name = name                  # A
      @happiness = 1                # A
      @@all << self                 # B
    end

    def play_with(toy)              # C
      puts “playing with”           
      puts toy
      @happiness *= 1.1             # A
    end

    def self.all                    # D, E
      @@all                         # B
    end
  end
  ```

  Bonus: Create a `Dog` class that inherits from the `Pet` class.
  
  
  ```ruby
  class Dog < Pet
  end
  ```


1. Define and briefly describe the MVC pattern. (Labeled diagrams work!)

  <strong>M</strong>odel, <strong>V</strong>iew, <strong>C</strong>ontroller
  
  Resources:
    * the first half of MDN's article on [MVC architecture](https://developer.mozilla.org/en-US/Apps/Fundamentals/Modern_web_app_architecture/MVC_architecture)  
    * Wikipedia's [Model-view-controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) article
    * lesson notes from your class!  








1. Briefly describe the purpose of each of the following in a Rails app:

  * `Gemfile`  file  - lists the gems needed to run the app in development, test, and production environments, along with version info
  
  * `bundle install` (or `bundle`) command - installs the gems listed in the `Gemfile`
  
  * `config/routes.rb`  file  - lists the routes the Rails server will have available  

  * `app/controllers/`  directory - contains the app's controllers, which handle passing information between the view and the model
  
  * `db/schema.rb`  file  - shows the structure of the tables in the database, including their column names and types, and says when the last change was made

  **For the next two questions, assume you have a Rails app with a `Plant` resource.**

1. Fill in the table below:

  | Goal | Route verb | Route path | Controller#Action | Database Method(s) |
  | --- | --- | --- | --- | --- |
  | Read all plants in db | `GET` | `/plants` | `plants#index`  | Plants.all |
  | Read one plant in db | `GET` | `/plants/:id` | `plants#show`  | `Plant.find(id)` |
  | Create a plant in db | `POST` | `/plants` | `plants#create`  | `p = Plant.new(plant_data)` <br> `p.save` |
  | Update a plant in db | `PUT` or<br> `PATCH` | `/plants/:id` | `plants#update`  | `Plant.find(id).update(plant_data)` |
  | Delete a plant in db | `DELETE` | `/plants/:id` | `plants#destroy`  | `Plant.find(id).destroy` |
  | Display a new plant form | `GET` | `/plants/new` | `plants#new` | `# for form display` <br> `p = Plant.new` |
  | Display an edit plant form | `GET` | `/plants/:id/edit`  |  `plants#edit` | `# for form display` <br> `p = Plant.find(id)` |
  




1. List at least 3 steps you’d take while adding a fully functional `Garden` resource to your app.

  There are many possible answers. Here are a few!

  * add a routes for gardens 
  * create a gardens controller with actions for each route
  * create views for the actions that use them: `index`, `show`, `new`, and `edit` 
  * generate a garden model with `rails generate` or `rails g`   
  * run your migration to add the garden table to the database
  * fill in the controller actions with ActiveRecord queries to handle the appropriate database interaction  
  


1. Given the controller code and view below, replace the `<a href=...>` tag with the appropriate Rails view helper.

  ```ruby
  # app/controllers/shoes_controller.rb
  def index
      @shoes = Shoe.all
  end
  ```
    
  
    
  ```ruby
  # views/shoes/index.html.erb
  <% @shoes.each do |shoe| %>
    <%= shoe.name %> - <a href="/shoes/<%= shoe.id %>">View this Shoe</a>
  
    <%= link_to "View this Shoe", shoe_path(shoe) %> 
    ______________________________________________________________________

  <% end %>
  ```

1. Display the “_foosball.html.erb” partial in the view below.
    
  ```html
  <h2>View the Foosball below!</h2>
  <div class=‘foos’>

    <%= render "foosball" %>

  </div>
  ```
