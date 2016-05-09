# Working with JS and turbolinks in Rails

| Objectives |
|------------|
| Be able to use JS in Rails and take advantage of the Asset Pipeline's minification |
| Be able to scope JavaScript to specific pages. |
| Be able to make use of turbolinks to dramatically speed up your app. |
| Be able to use JS alongside turbolinks |


# Using JavaScript in Rails is a little different...

Rails has a couple of features that make using javascript on your pages a little bit different.  Those include **the asset pipeline** and **turbolinks**.

##### the Asset Pipeline

The asset pipeline is there to help speed up our pages.  It combines all of our JS files into one minified (in production) JS file.  That means that **all your JS code runs on every page**.

If you have a `$('img').on('click')` it's going to be called for every image in your app on every page.

##### Turbolinks

Turbolinks will make it so that your `$(document).ready` is only called on the first page the user visits.  When they click a link and view a new page, `$(document).ready` is not triggered again.

As you've seen we can simply [disable turbolinks](http://blog.steveklabnik.com/posts/2013-06-25-removing-turbolinks-from-rails-4).  Later on we'll see how we can work _with turbolinks_.


## Working with the Asset Pipeline

The Asset Pipeline is a great tool for minifying all of your assets and speeding up page load times.  But it adds some additional challenges when working with JavaScript.  

It also gives you the chance to organize your javascript into many files and not have to worry about synchronizing which script depends on others and organizing your script tags to match.

Since all of our javascript in the app is active on every page in the app we have to be careful about how we bind to events.  For example:

```js
$('button#save').on('click', function(e) { 
  console.log('save button clicked!');
  var title = $('input#title').val();
  $.post('/posts', { title: title }).success(....
```

What happens if we have a button `<button class="btn" id="save">` on our `posts/new` page?

It works right?  No problems.  

Now what if we also have a modal on `/posts/:id` that lets users submit a comment.  It might also have a `<button class="btn" id="save">` and our JS here will bind to it as well.  We'll try to save a post when we really want to just save the comment.  Or maybe we'll do both?


### Dealing with this problem

The solution here is pretty clear, we just need to make sure we're careful with our **selectors** and make sure that they're unique across the **entire app**.

I'm going to give you **two** ways to do this.  There are of course others but the key is to be very precise in what you're binding to.

1. Use very specific complex selectors or very specific IDs.
  
  ```html
  <!-- this -->
  <button class="btn" id="save">
  <!-- can be refactored to -->
  <button class="btn" id="save-post">
  ```
  
  Another alternative might be to scope our jQuery better.
  
  ```js
  //this
  $('button#save').on('click', function(e) { 
  // refactors to:
  $('div#post-single-form button#save').on('click', function(e) { 
  ```
  
  In either case the key is to make our **selectors** as specific as possible.
  
1. The other alternative is to add a little page-specific identifier to each page.  Then we can bind our JS to that:

  ```html
  <!-- app/views/layouts/application.html.erb -->
	
	<body class="<%= controller_name %> <%= action_name %>">
	  <%= yield %>
	</body>  
  ```
  
  Then in our JS we can bind to this.
  
  ```js
  postNewView = 'body.posts.show';
  $(postNewView + ' #save').on('click', func..
  // or
  $(postNewView).on('click', '#save', func...
  ```
 
____
 
## Working with turbolinks
  
### What is turbolinks?
  
**Turbolinks is magic**.  It uses JavaScript to take over all the `<a href` tags.  



When the user clicks a link: 

1. it `preventDefault`s on the clicked link 
2. If the link is cached it uses the cached version!  Otherwise it makes an AJAX request for the html the link pointed to.  _(HTML not JSON)_
3. The server responds with HTML for the requested page.  
4. Turbolinks replaces the body of the current page with the HTML body it received from the server.
5. It sets the URL of the browser to match using `history.pushState`.


##### How does it do this?

Turbolinks takes over managing the html history using `history.pushState` and sets the URL of the browser.

  
#####  Why does it do this?  

**It makes your app faster.**  A full page load takes a fair bit of time for a browser.
But with turbolinks our browser doesn't have to re-parse the entire document for each request.  It doesn't have to recompile the JS and the CSS for each request.  Instead your JS keeps running in the background.  We gain some of the speed benefits of a **S**ingle **P**age **A**pp but we get the coding simplicity of continuing to work with the standard monolithic structure. 

Try it out in your app, you should be able to notice a difference.


### Working with turbolinks

With turbolinks we have a few considerations to keep in mind.

* Since the JavaScript isn't reloaded each page and keeps running for much longer we have to be more careful about using global variables, leaking memory and just generally being considerate.  The JS processes will stay running for a much longer time.
* document-ready only happens on the first page.  Instead of `$(document).on('ready'` we can use `$(document).on('page:load'`.  


Most of the time you can safely just switch to using 

```js
$(document).on('ready page:load', function...
```

Anywhere and _most_ things will work as expected.  



## Resources

* [turbolinks](https://github.com/turbolinks/turbolinks-classic/tree/2-5-stable) classic 2.5.  Note that this version is in use in Rails 4 but is now deprecated.  Turbolinks 3 was planned for rails 5 but development was discontinued.  A new re-write is currently being written.
* 