# Working with JS and turbolinks in Rails

| Objectives |
|------------|
| Know what the term 'unobtrusive javascript' means |
| Be able to use JS in Rails and take advantage of the Asset Pipeline's minification |
| Be able to scope JavaScript to specific pages. |
| Be able to make use of turbolinks to dramatically speed up your app. |
| Be able to use JS alongside turbolinks |



# Using JavaScript in Rails is a little different...

Rails has a couple of features that make using javascript on your pages a little bit different.  Those include **the asset pipeline** and **turbolinks**.

##### built-in Unobtrusive JavaScript helpers

Rails makes it easy to turn on some simple JavaScript with a single key:value.  All of these helpers degrade gracefully on browsers with incomplete support.

##### the Asset Pipeline

The asset pipeline is there to help speed up our pages.  It combines all of our JS files into one minified (in production) JS file.  That means that **all your JS code runs on every page**.

If you have a `$('img').on('click'` it's going to be called for every image in your app on every page.

##### Turbolinks

Turbolinks will make it so that your `$(document).ready` is only called on the first page the user visits.  When they click a link and view a new page, `$(document).ready` is not triggered again.

As you've seen we can simply [disable turbolinks](http://blog.steveklabnik.com/posts/2013-06-25-removing-turbolinks-from-rails-4).  Later on we'll see how we can work _with turbolinks_.


## Unobtrusive JavaScript in Rails

Rails - on it's own follows the conventions of **unobtrusive javascript**.  The Rails devs suggest that we do the same.  

Basic **Unobtrusive JavaScript** guidelines:

* To separate JavaScript from HTML markup, as well as keeping modules of JavaScript independent of other modules.
* Unobtrusive JavaScript should degrade gracefully - all content should be available without all or any of the JavaScript running successfully.
* Unobtrusive JavaScript should not degrade the accessibility of the HTML, and ideally should improve it, whether the user has personal disabilities or are using an unusual, or unusually configured, browser.

> From: Flanagan, David (2006). JavaScript: The Definitive Guide (5th ed.). O'Reilly & Associates. p. 241. ISBN 0-596-10199-6.


Rails comes with some JavaScript helpers built-in.  These all try to degrade gracefully - the view elements affected will still work even if the JS doesn't load or run as expected.

The tools that we discuss below can all be used to follow the unobtrusive javascript guidelines.  For example, the asset pipeline makes it easy for us to organize our files and your app will work just fine even if turbolinks isn't there.

### Working with the unobtrusive driver

You've probably already used it to display a pop-up alert: `data: {confirm: "Are you sure?"}`

```html
<%= link_to 'Delete Album', album, method: :delete, class: 'btn btn-danger', data: { confirm: "Are you sure you want to delete '#{album.name}'?" } %>
```

This is just one of the many available helpers provided by the jquery_ujs gem included in Rails.  Others include: 


* "data-disable-with": Automatic disabling of links and submit buttons in forms
* "data-method": Links that result in POST, PUT, or DELETE requests

See more [here](https://github.com/rails/jquery-ujs/wiki/Unobtrusive-scripting-support-for-jQuery).

##### AJAX

There are also several AJAX helpers that degrade gracefully.  

The most important one to know is **`data-remote: true`** which will configure the JavaScript driver to use AJAX with the link, button or form. 

Let's look at an example:

```html
<!-- some_view.html -->
<div id='counter'>
  <p> The count is: <span id='count'><%= @count %></span></p>
 <%= button_to "Count +1", plus_one_path, remote: true, method: 'post', class: "btn btn-primary"  %>
</div>
```

You can see that we've set `remote:true` to use AJAX.  Rails will automatically `preventDefault` on the button but we probably want to do something with the result too.  Let's see how:

The driver adds several new _events_ that we can bind to like `ajax:success` and `ajax:error` and `ajax:before`.

```js
// somewhere.js
$(document).on("ajax:success", '.counter', function(e, data) {
  $('#count').text(data.count);
});
$(document).on("ajax:error", '.counter', function(e, xhr, status) {
  console.log('Oh no! Error!');
});

```

Checkout [this wiki](https://github.com/rails/jquery-ujs/wiki/ajax) for more details!

> Of course you *can* still use regular jQuery and AJAX.  They just won't have the graceful degrading that you get with the unobtrusive driver.

_____ 

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
  <button class="btn" id="new-save-post">
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
  
  Then in our JS we can bind to the now modified body tag.
  
  ```js
  postNewView = 'body.posts.show';
  $(postNewView + ' #save').on('click', func..
  // or
  $(postNewView).on('click', '#save', func...
  ```
 
____
 
## Working with turbolinks
  
### What is turbolinks?
  
**Turbolinks is magic**.  It uses JavaScript to take over all the `<a href=...` tags.  


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
$(document).on('page:load', function...
// or 
$(document).on('page:change', function...
```

Anywhere and _most_ things will work as expected.  

##### turbolinks events
> from https://github.com/turbolinks/turbolinks-classic

With Turbolinks pages will change without a full reload, so you can't rely on `DOMContentLoaded` or `jQuery.ready()` to trigger your code. Instead Turbolinks fires events on `document` to provide hooks into the lifecycle of the page.

Event                | Argument `originalEvent.data` | Notes
-------------------- | ----------------------------- | -----
`page:before-change` | `{url}`                       | The page is about to change. **Cancellable with `event.preventDefault()`.** Does not fire on history back/forward.
`page:fetch`         | `{url}`                       | A new page is about to be fetched from the server.
`page:receive`       | `{url}`                       | A page has been fetched from the server, but not yet parsed.
`page:before-unload` | `[affectedNodes]`             | Nodes are about to be changed.
`page:change`        | `[affectedNodes]`             | Nodes have changed. **Also fires on `DOMContentLoaded`.**
`page:update`        |                               | Fired alongside both `page:change` and jQuery's `ajaxSuccess` (if available).
`page:load`          | `[newBody]`                   | A new body element has been loaded into the DOM. **Does not fire on partial replacement or when a page is restored from cache, so as not to fire twice on the same body.**
`page:partial-load`  | `[affectedNodes]`             | New elements have been loaded into the DOM via partial replacement.
`page:restore`       |                               | A cached body element has been loaded into the DOM.
`page:after-remove`  | `affectedNode`                | An element has been removed from the DOM or body evicted from the cache and must be cleaned up. jQuery event listeners are cleaned up automatically.

**Example: load a fresh version of a page from the server** 

* page:before-change a Turbolinks-enabled link has been clicked (see below for more details)
* page:fetch starting to fetch a new target page
* page:receive the page has been fetched from the server, but not yet parsed
* page:before-unload the page has been parsed and is about to be changed
* page:change the page has been changed to the new version (and on DOMContentLoaded)
* page:update is triggered alongside both page:change and jQuery's ajaxSuccess (if jQuery is available - otherwise you can manually trigger it when calling XMLHttpRequest in your own code)
* page:load is fired at the end of the loading process.


## Resources

* [turbolinks](https://github.com/turbolinks/turbolinks-classic/tree/2-5-stable) classic 2.5.  Note that this version is in use in Rails 4 but is now deprecated.  Turbolinks 3 was planned for rails 5 but development was discontinued.  A new re-write is currently being written.
* [Unobtrusive Javascript on Wikipedia](https://en.wikipedia.org/wiki/Unobtrusive_JavaScript)
* [Working with JavaScript in Rails](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)
* [Unobtrusive scripting support JQuery](https://github.com/rails/jquery-ujs/wiki/Unobtrusive-scripting-support-for-jQuery)
* jQuery-ujs [data-remote](https://github.com/rails/jquery-ujs/wiki/ajax) docs.
