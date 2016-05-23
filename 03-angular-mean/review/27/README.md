# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> MEAN stack review

| **Learning Objectives** |
| :---- |
| *Students will be able to:* |
| Revisit the MEAN stack and explain the role of each technology within that stack. |
| Give detailed account of the purpose of the different files and folders that make up a MEAN app. |
| Revisit Angular syntax and write examples of important built-in directives. |

#### Consider the following statement

*Ruby on Rails is superior to the MEAN stack because Ruby is a much more beautiful
and feature-rich language than Javascript. Rails is designed to expedite
development time because it has built in structures to facilitate CRUD and
many other common web development tasks.*

Take two minutes to write down your reaction.


#### Now, consider the following statement

*The MEAN stack is better than Rails because it is all JavaScript, the native language of the web.
Node's built in V8 JS engine makes the MEAN stack app far faster than a Ruby on
Rails app. Angular creates dynamic, single page apps which are more intuitive to write
than the `.erb` style templating of Rails apps.*

Take two minutes to write down your reaction.


## MEAN
What does MEAN mean? Without using any other resources, write down what you know about each of the following:

**MongoDB**/(Mongoose)

**Express**

**AngularJS**

**Node**

Why do we use the MEAN stack?

### What is MongoDB/(Mongoose)?

* `MongoDB` is a no-SQL database.
* Generally we will not be interacting _directly_ with MongoDB, instead we'll be working with `mongoose`.
* `Mongoose` is a library or "wrapper" that gives us a bunch of convenience methods for working with MongoDB records (kind of like jQuery's convenience methods for manipulating the DOM).

### What is Express JS?
- Express is a framework built on top of Node.js that makes development of web servers more intuitive and quicker.
- Express allows us to easily set up routes that will trigger actions such as rendering pages or returning JSON.

### What is AngularJS

From the [Angular Guide Introduction](https://docs.angularjs.org/guide/introduction):

* A "framework for dynamic web apps"
* "Lets you use HTML as your template language" and helps you "extend HTML's syntax"
* "Handles all of the DOM and AJAX glue code you once wrote by hand and puts it in a well-defined structure"
* Is "opinionated about how a CRUD application should be built"
* Comes with "Data-binding, basic templating directives, form validation, routing, deep-linking, reusable components and dependency injection"
* "Angular simplifies application development by presenting a higher level of abstraction to the developer"
* "Not every app is a good fit for Angular. Angular was built with the CRUD application in mind."

### What is Node?
- Node.js is a webserver that operates on the V8 Google Chrome JavaScript runtime, allowing you to write server-side code in JavaScript.
- Node.js provides the ability to handle requests and issue responses.
- It is fast.
- It is fast largely because it is asynchronous, meaning code can run in parallel without "blocking" the call stack (the list of other concurrent commands).



# `tunely-angular` app

Let's check out the [`tunely-angular` sprint 5 solutions branch](https://github.com/SF-WDI-LABS/tunely-angular/blob/master/docs/sprint5.md) as a subject for our review study.

This is a fully functional MEAN stack app.You'll be assigned a piece from within this list:

* `public/scripts/app.js`
* `public/scripts/AlbumsIndexController.js`
* `public/scripts/AlbumsShowController.js`
* `views/templates`
* `views/index.html`
* `server.js`
* `controllers/albumsContoller.js`
* `controllers/albumsSongsContoller.js`
* `controllers/apiContoller.js`
* `controllers/index.js`
* `models/album.js`
* `models/index.js`
* `package.json` and `bower.json`
* `seed.js`

Let's investigate these pieces and answer the following questions:

1. Is this server-side code or client side code?
1. What parts of the MEAN stack does this represent? What technologies are present here (HTML, CSS, middleware, JavaScript, etc.)?
1.  What is this piece of the application (file or directory) responsible for?
1. What lines of code are most important for understanding how this works?
1. What 3-5 lines of code are difficult to understand at first glance? After a closer look, what does that code do?


Once you've written something out, taken the key screenshots (`cmd`+`shift`+ `4`), and gathered all the info you want to show us, please put your responses in this [google doc](https://docs.google.com/document/d/1TqeVF1LPKv5I3X-FD157eYtVCbFEMim3Svg9TvBjhRQ/edit?usp=sharing). We'll each present 2-5 minutes on the piece we investigated to refresh the class on what it does.


# Writing some Angular

### What is a directive?

Write a page to perform an example of two of the following angular directives.

* `ng-repeat`
* `ng-show` and/or `ng-hide`
* `ng-model`
* `ng-click`
* `ng-submit`
* `ng-href`
* `ng-src`

[Reviewing `tunely-angular` sprint 1](https://github.com/SF-WDI-LABS/tunely-angular/blob/master/docs/sprint1.md) may help to get your example set up.

On the [google doc](https://docs.google.com/document/d/1TqeVF1LPKv5I3X-FD157eYtVCbFEMim3Svg9TvBjhRQ/edit), include at least two screen shots that display the evidence that your directives are functioning. Include two or more sentences explaining why these screenshots are evidence of the directives you selected. 

Resources:
* [Angular introduction notes](https://github.com/SF-WDI-LABS/shared_modules/tree/master/03-angular-mean/intro-angular/27-28)
* [An intro to Mongo/Express/Node from WDI25](https://github.com/SF-WDI-LABS/shared_modules/tree/master/03-angular-mean/intro-mean/25)
