# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> WDI Week 7 Assessment

1. Fill in the hash below with your name and cohort:

  `my_info = { :name => “__________________________”,   :cohort => ______ }`

1. In Ruby, declare a variable called `favorite_food`, and set it equal to your favorite food. Then use your `favorite_food` variable to create a string proclaiming your favorite food: "My favorite food is ________."



1. Write a Ruby regular expression that matches the first digit in a string. For example, your regex should match the `1` in `"Party like it’s 1999!"`


1. Write a method called `fastest` that takes a `speeds` array parameter and _both_ prints and returns the fastest speed.  

  > Example Use:      
  ```ruby
  fastest([55, 25, 70, 40])
    70
    => 70
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


1. Use the `play_with` method on the pet you just created and a toy of `"rope"`.




  ```ruby
  class Pet						
  	attr_accessor :name
  	attr_reader :happiness

    @@all = []

  	def initialize(name)
      @name = name
      @happiness = 1
      @@all << self
    end

    def play_with(toy)
      puts “playing with”
      puts toy
      @happiness *= 1.1
    end

    def self.all
      @@all
    end
  end
  ```

  Bonus: Create a `Dog` class that inherits from the `Pet` class.


1. Define and briefly describe the MVC pattern. (Labeled diagrams work!)










1. Briefly describe the purpose of each of the following in a Rails app:

  * `Gemfile`  file   
  * `bundle install` (or `bundle`) command   
  * `config/routes.rb`  file    
  * `app/controllers/`  directory   
  * `db/schema.rb`  file   

  **For the next two questions, assume you have a Rails app with a `Plant` resource.**

1. Fill in the table below:

  | Goal | Route verb | Route path | Controller#Action | Database Method(s) |
  | --- | --- | --- | --- | --- |
  | Read all plants in db | `GET` |  | `plants#index`  |  |
  | Read one plant in db |  |  | `plants#show`  | `Plant.find(id)` |
  | Create a plant in db |  |  |   | `p = Plant.new(plant_data)` <br> `p.save` |
  | Update a plant in db |  | `/plants/:id` |   |  |
  | Delete a plant in db | `DELETE` |  | `plants#destroy`  |  |
  | Display a new plant form |  | `/plants/new` |   | `# for form display` <br> `p = Plant.new` |
  | Display an edit plant form | `GET` |  |   |  |
  




1. List at least 3 steps you’d take while adding a fully functional `Garden` resource to your app.






11. Given the controller code and view below, replace the `<a href=...>` tag with the appropriate Rails view helper.

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
  
  
     ______________________________________________________________________


  <% end %>
  ```

1. Display the “_foosball.html.erb” partial in the view below.
    
  ```html
  <h2>View the Foosball below!</h2>
  <div class=‘foos’>



  </div>
  ```
