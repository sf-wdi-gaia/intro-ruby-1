<!--
Creator:
Location: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Ruby Intro

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*
Ruby is a powerful and popular language for server-side web development. It's the foundation for Ruby on Rails, one of the most prolific frameworks in the web.

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- List Ruby data types.
- Leverage JavaScript experience to recognize patterns and structures in Ruby.
- Articulate strategies to learn new programming languages and frameworks.
- Run Ruby code in an interactive CLI or from a file.


### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

- List JavaScript data types.
- Recognize and code JavaScript conditionals and loops.


## Ruby as a Second (or 4<sup>th</sup>) Language

As we learn Ruby, it's important to revisit how we learned our first language and use that to organize the study of our new language. Learning our second programming language is a process of translating concepts, expressions, and patterns from our familiar language into our new language. Learning our first language involved more identification and comprehension of the knowledge required to implement our first programs. We should begin by organizing this knowledge to build a better understanding as we transition to Ruby.


## Discussion Questions

* What is JavaScript? What does it look like?
* How did we build up to back-end web development from the fundamentals of JavaScript?
* What could possibly be different in another language? How could we change the syntax, but keep the most important structures?

## The Beauty of Ruby

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


Without knowing anything about Ruby, you can probably sort of understand how all this works:

1. What kind of object is `make_a_sentence`?
1. What does `def` do?  
1. What's the purpose of the line that starts with `#`?

You might notice something else interesting – where are the semicolons? You don't need them!

Ruby is lauded for being clean and beautiful - it has less punctuation and fewer reserved words than JavaScript! Over time, you'll find you have an appreciation for both languages, but for now let's relish forgetting the `;`!


**# Comments**

It's worth noting that while single-line comments in JS look like this:

```js
// I'm a comment
```

Ruby's are like this:

```ruby
# I'm a comment, too!
```

A "hash rocket" or "fat arrow" in a comment means the comment is showing off a value that gets returned by a method or expression:

```ruby
4 + 4
# => 8
```



### Experiment!

Ruby and JavaScript are both **interpreted languages**, meaning there's another program on our computers that knows how to look at code in those languages and translate it into machine-readable code basically line by line as its run. Some ideas will carry over from JavaScript in a really straightforward way.

There are a lot of differences between the JavaScript and Ruby interpreters, though.  A few important examples are that Ruby can't pass around functions, doesn't hoist variables, and has a different system for variable scope.  

We'll see more about each of these differences later.  For now, keep in mind that your intuition could mislead you - you should look at documentation _and_ experiment as you learn Ruby.


We're going to use PRY, an interactive Ruby shell tool, so we can type some Ruby commands and see exactly what happens in real time.

Open up your terminal, and from anywhere, type `gem install pry`
then type `pry`.

*Other options for running ruby code:*

1. Use `irb` (interactive ruby) in your terminal.

1. Create a `.rb` file. Write your code there then run it with `ruby YOUR_FILE_NAME.rb`.



## Data Types

### Review

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
  <br><br>
1. `"hello world"` is still a **String**.  Try "hanging a dot" in pry (type `"hello world".` then hit tab a few times) to see the method available for Ruby strings.

1.  `[1,2,3,4]` is still an **Array**.

1. `{keys: ['some', 'values'] }` is called a **Hash**, but works almost the same as a JavaScript object.  A key difference is that values inside a Hash *must* be accessed with bracket notation (try it!).

1. Ruby's version of `null` is `nil` (`NilClass`).

1. Ruby has an extra data type called a **Symbol**!  Symbols are like strings, except they only get stored in memory once. JavaScript recently adopted symbols. In both languages, they're often used as the keys inside objects/hashes.


Most importantly, **in Ruby, _everything_ is a reference data type**. There are no primitives! That means that each of the above data types have methods & properties just like our JavaScript objects did.


#### Let's recap our data types in Ruby:

- **Booleans** are written as `true` and `false`
- **Integers** are written as `12`
- **Floats** are written as `9.45`
- **Strings** are written as `"awesome"`
- **Symbols** are written as `:awesome`
- **Arrays** are written as `['x','y','z']`
- **Hashes** are written as `{key: 'value', things: true, stuff: [1,2,3]}` or `{:key => 'value'}`
- **nil** is the equivalent of JavaScript's `null`


### Duck Typing
<details><summary>If it quacks like an integer... </summary>

Unlike JavaScript, Ruby categorizes numbers as floats or integers. This creates some interesting results! Let's take a look in PRY:

What happens if we use pry to calculate `5 / 2`?

 > Have we broken Ruby? No, we have given ruby two integers (numbers with no decimal places) so ruby gives us an integer back.

Compare to what happens when we divide an integer by a float, with `5 / 2.0`.


This is called "Type Coercion" and is also known as "Duck Typing"; Ruby now knows that we want a float back.

If an object quacks like a duck (or acts like a string), just go ahead and treat it as a duck (or a string).


We've seen a similar result with JavaScript:

```js
'1' + 4
=> '14'
```

1. What happens if you enter the code above into pry?

1. Expiriment with `%` and integers and floats. 

</details>

### Converting between Data Types
<details><summary>`"7"` wonders what it's like to be a number</summary>

If we want to convert one data type to another in Ruby, there are some built-in methods that we can use. Here are a few examples:

```ruby
# Converting to a String
3.14.to_s
=> "3.14"

# Converting to an Integer
"16".to_i
=> 16
```

1. Can you find at least one other example?

1. In JavaScript, we saw that `"7" == 7` is `true` but `"7" === 7` is `false`.  What do you get when you try these out in pry?

</details>

### String Interpolation
<details><summary>Concatenate less.</summary>

Our strings have a superpower!

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

So so useful. It works with anything – more complex can run in those brackets, and Ruby will evaluate it and use the results in the string, just like we want!

Right??  (Try out a few examples with single quotes.)

</details>

### Symbols
<details><summary>What do they mean?</summary>
We haven't seen symbols before.  Try using Ruby's built in `.object_id` method to see the difference between symbols and strings:

```ruby
"hi".object_id # => 70359038665560
"hi".object_id # => 70359036620120
:hi.object_id  # => 1092828
:hi.object_id  # => 1092828
```

1. Why do you think symbols are used as the keys for hashes?
</details>

## Variables

Just like JavaScript, **we're gonna need some variables to hold stuff.**

_Unlike_ JavaScript, Ruby's variables don't need to be declared with a special reserved word.

Where you're now used to:

```js
var genius = "me";
```

We can skip right to the good stuff:

```ruby
genius = "me"
```

#### Local Variables

A local variable in Ruby is written in `lower_snake_case` by convention.

```ruby
favorite_food = "donuts"
favorite_food *= 3  # => "donutsdonutsdonuts"

```

We'll talk about Ruby scoping when we go over methods, but know that local variables are  restricted to the  method they're inside of. They can't get their value outside the method, and they are deleted once the method is finished.


#### Constants

Usually, we're able to change the value a variable's holding if we so choose – constants are designed for the opposite. Constants are meant to be placeholders that _never change_.

```ruby
WAR_QUOTE = "War never changes."  

WAR_QUOTE = "What is it good for?" # warning: already initialized constant
```

Constants are meant to be defined _only once_, so they're often used for things like storing application settings, or other stuff we don't intend to change.

> You'll see many other conventions of Ruby as you learn it!


## Research & Experiment

### Printing to the Console

The `console.log` method is an awesome debugging tool in JavaScript. Ruby has three methods that all print out output: `puts`, `p`, and `print`.  Use pry to investigate the differences among these methods. Prepare to explain to the group.

### Conditionals

Conditionals were an important part of JavaScript control flow; we use `if/else if/else` all the time.  What is the Ruby syntax for conditionals? Prepare an example of how you'd use conditionals in Ruby.


### Loops

Repeated behavior means loops!  JavaScript celebrated `for` and `while`. Ruby has many more ways to loop. Take a look at:

1. <a href="http://ruby-doc.org/core-2.0.0/Integer.html#method-i-times" >`.times`</a>:  What is its JavaScript equivalent?  Can you give an example of when you would use this method to loop?

2. <a href="https://ruby-doc.org/core-2.2.0/Array.html#method-i-each">`.each`</a>:
What is its JavaScript equivalent?  Can you give an example of when you would use this method to loop?


## Closing Thoughts

1. What are some strategies you're using to pick up Ruby?  
1. What resources do you think will be helpful for you?  

## Docs & Resources

* <a href="http://ruby-doc.org/core-2.2.0/Array.html" >Ruby Docs: Array</a>
* <a href="http://ruby-doc.org/core-2.2.0/Hash.html" >Ruby Docs: Hash</a>
* <a href="https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures" >Ruby Control Flow Structures</a>
