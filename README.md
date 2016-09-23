# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Ruby

| Objectives |
| :--- |
| Identify data types, operators, and control flow patterns in JavaScript and utilize them in Ruby |
| Apply Ruby control flow to create command line applications |

## Framing for the Week

As we learn Ruby, it's important to revisit how we learned our first language and use that to organize the study of our new language. Learning our second programming language is a process of translating concepts, expressions, and patterns from our familiar language into our new language. Learning our first language involved more identification and comprehension of the knowledge required to implement our first programs. We should begin by organizing this knowledge to build a better understanding as we transition to Ruby.


## Discussion Questions

* What is JavaScript? What does it look like?
* How did we use JavaScript to build things? How did we build up from the fundamentals of the language?
* What could possibly be different in another language? How could we change the syntax, but keep the semantics?

## The Beauty of Ruby - Intro (5 mins)

> <cite>"I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. That is the primary purpose of Ruby language."</cite>
> - Ruby creator Yukihiro Matsumoto (a.k.a. "Matz")

One of the things that's important to people who write code in Ruby is how the code _reads_. Rubyists are known for writing code in a way that reads as much like normal English as possible. That helps make it easy to learn for beginners.

Check out this example:

```ruby
def make_a_sentence(words)
  words.join(' ') + "!"
end

make_a_sentence(['You', 'are', 'already', 'experts'])
# => "You are already experts!"
```

Without knowing anything about Ruby, you can probably sort of understand how all this works. Nice, right?

> **Awesome Detail:** You might notice something interesting – where are the semicolons? You don't need them!

> Ruby is lauded for being clean and beautiful - it has less punctuation than JavaScript! Over time, you'll find you have an appreciation for both languages, but for now let's relish forgetting the ';'!


### Follow along!

As we experiment with Ruby syntax, you should follow along and try things yourself. Do what we do, but feel free to mess around and try your own little experiments too.

We're gonna use PRY, our interactive Ruby shell tool, so we can type some Ruby commands and see exactly what happens in real time, and you can follow along and code.

Open up your terminal, and from anywhere, type `gem install pry`
then type `pry`.

*Other options for running ruby code:*

1. Use `irb` (interactive ruby) in your terminal.

1. Create a `.rb` file. Write your code there then run it with `ruby YOUR_FILE_NAME.rb`.

### Data Types

####Review

1. **What are some data types you have used in JavaScript?**

  <details><summary>click for a list</summary>
  - **Booleans** are written as `true` and `false`
  - **Numbers** are written as `12` or `9.45`
  - **Strings** are written as `"awesome"`
  - Special **undefined** type for things that have never had a value.
  - **Arrays** are written as `['x','y','z']`
  - **Objects** are written as `{key: 'value', thing: true, stuff: [1,2,3]}`, and have a special **null**.
  </details>

Now, let's see which of those are similar in Ruby, and which are different.

1. Let's start with `undefined`. Type `undefined` into `pry` and hit enter.  We get an error, so `undefined` isn't defined in Ruby. In fact, Ruby doesn't have an undefined type - we'll just get this same error message if Ruby doesn't know a value for a variable.
1. Try typing `true` or `false` into pry.  We don't get an error, so these must be defined in Ruby. In fact, these are still our **booleans**! Try typing `true.class` and `false.class` to see the Ruby class for each `TrueClass` / `FalseClass`!
1. How about those numbers?!  Try `3.class` and `3.14.class`. Two things to note:
  - numbers with decimals are **Floats**
  - **Integers** are divided into a few classes - here we see `FixNum`
1. `"hello world"` is still a **String**.
1.  `[1,2,3,4]` is still an **Array**.
1. `{keys: ['some', 'values'] }` is called a **Hash**, but works almost the same as a JavaScript object.
1. Ruby's version of `null` is `nil` (`NilClass`).


Most importantly, **in Ruby, _everything_ is a reference data type**. There are no primitives! That means that each of the above data types have methods & properties just like our JavaScript objects did.


#### Let's recap our data types in Ruby:

- **Booleans** are written as `true` and `false`
- **Integers** are written as `12`
- **Floats** are written as `9.45`
- **Strings** are written as `"awesome"`
- **Arrays** are written as `['x','y','z']`
- **Hashes** are written as `{key: 'value', thing: true, stuff: [1,2,3]}`
- **nil** is the equivalent of JavaScript's `null`


#### Duck-typing

Unlike JavaScript, Ruby categorizes numbers as floats or integers. This creates some interesting results! Let's take a look in PRY:

What happens if we do:

```ruby
5 / 2
=> 2
```

Have we broken Ruby? No, we have given ruby two Integers (numbers with no decimal places) so ruby gives us an Integer back.

However, if we divide an Integer by a Float:

```ruby
5 / 2.0
=> 2.5
```


This is called "Type Coercion" also known as "Duck Typing"; Ruby now knows that we want a Float back.

If an object quacks like a duck (or acts like a string), just go ahead and treat it as a duck (or a string).


We've seen a similar result with JavaScript:

```js
'1' + 4
=> '14'
```

What happens if you enter the code above into pry?


#### Converting between Data Types

If we want to convert one data type to another in Ruby, there are some built-in methods that we can use. Here are a few examples:

```ruby
# Converting to a String
3.14.to_s
=> "3.14"

# Converting to an Integer
"16".to_i
=> 16
```

#### Comments!

It's worth noting that will comments in JS look like this:

```js
// I'm a comment
```

Ruby's are like this:

```ruby
# No, I'm a comment
```

Since you guys comment your code, that'll be useful!

#### Fun Tip: Our strings have a superpower!

One super awesome trick that you will undoubtedly use all the time comes from our friend, the **String** object.

It's called **string interpolation** – and it lets us build complicated strings without having to add them together the old fashioned way.

We used to have to do this:

```ruby
first = "Ben"
last = "Franklin"
first + " " + last # => Ben Franklin
```

That works, but this is way cooler:

```ruby
first = "Ben"
last = "Franklin"
"#{first} #{last}" # => Ben Franklin
```

So so useful. It works with anything – any code can run in those brackets, and it'll evaluate and turn into a string. Right??

####Try it!
1. Store your `first_name` in a variable and your `last_name` in another variable.

2. Concatenate your `first_name` and `last_name` variables, and store the output in a new variable called `full_name`.

3. Use <a href="http://ruby-doc.org/core-2.2.0/String.html#method-i-split" target="_blank">`.split`</a> to turn your `full_name` variable into an array.

### Loops

1. Print (`puts`) "Ruby is awesome!" 50 times. Implement this 3 different ways, using:
  * <a href="http://www.tutorialspoint.com/ruby/ruby_loops.htm" target="_blank">`while`</a>
  * <a href="http://www.tutorialspoint.com/ruby/ruby_loops.htm" target="_blank">`for`</a>
  * <a href="http://ruby-doc.org/core-2.0.0/Integer.html#method-i-times" target="_blank">`.times`</a>

2. Save any string to a variable, then create an empty hash called count (`count = {}`). Loop through the string, and count occurrences of each letter. Store the counts in your hash like this example:
  * For the string `apple`, your `count` hash would look like this: `{a: 1, p: 2, l: 1, e: 1}`.

3. Write a program that gets user input from the terminal and `puts` it until the input is the word `"quit"` or `"q"`.
  * **Hint:** Use `gets.chomp` instead of `gets` to remove trailing `\n`.

4. Write a program that prints the "bottles of beer on the wall" song:

  ```
  5 bottles of beer on the wall,
  5 bottles of beer!
  Take one down and pass it around,
  4 bottles of beer on the wall!
  ...
  ```

  * Use `gets.chomp` to ask the user how many verses they want to hear.
  * Make sure your song prints "1 **bottle** of beer".
  * When the song gets to "0 bottles of beer on the wall", it should print "No more bottles of beer on the wall" instead.

## Stretch Challenges

### Iterators: Each

1. Define an array of 4 phrases: `"Hello, world"`, `"OMG"`, `"Ruby"`, and `"Pair Programming"`. Use <a href="http://www.tutorialspoint.com/ruby/ruby_iterators.htm" target="_blank">`.each`</a> to iterate over the array and `puts` each phrase.

2. Iterate over your array of phrases again, but this time, only `puts` the phrase if its length is 5 letters or longer. Otherwise, print a message that the phrase is too short, and include the phrase's index in the message (**Hint:** Look up `.each_with_index`).

### Iterators: Map

1. Write a program that <a href="http://ruby-doc.org/core-2.2.0/Array.html#method-i-map" target="_blank">maps</a> an array of numbers to double each number.

2. Write a program that maps an array of words to the reverse of each word. (**Hint:** Look up `.reverse`)

### More Stretch Challenges

1. Create a simple temperature convertor. It should function like the example below:

  ```
  Type '1' to convert from Celsius to Fahrenheit or '2' to convert from Fahrenheit to Celsius
  1
  Enter Celsius temperature:
  24
  24 degrees Celsius is equal to 75.2 degrees Fahrenheit
  ```

2. Create a simple calculator that first asks the user what method they would like to use (addition, subtraction, multiplication, or division), then asks the user for two numbers, printing the result of the method with the two numbers. Here is a sample prompt:

  ```
  What calculation would you like to do? (add, sub, mult, div)
  add
  What is the first number?
  3
  What is the second number?
  6
  The result is 9
  ```

## Docs & Resources

* [Ruby Data Types & Variables](./ruby-data-types-variables.md)
* <a href="http://ruby-doc.org/core-2.2.0/Array.html" target="_blank">Ruby Docs: Array</a>
* <a href="http://ruby-doc.org/core-2.2.0/Hash.html" target="_blank">Ruby Docs: Hash</a>
* <a href="https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures" target="_blank">Ruby Control Flow Structures</a>
