# Rails Asset Pipeline Exercises

### Asset Pipeline Poem

Start with the [asset pipeline poem lab](https://github.com/sf-wdi-27-28/asset_pipeline_poem).  Move on to the "Take it Further!" challenges below when you have these steps complete:

1. Put the lines of the file and title in the correct order.  
2. Show the character count (see screenshot in lab readme).  
3. Precompile so that all of your JavaScript and CSS assets are combined into one file each.

### Take it Further!

#### Displaying Images

 1. Add two images of your choice to your `app/assets/images` folder
 2. Add one image to your main site index view by calling the file name in an `image_tag` erb view helper.
 
  ```
    <%= image_tag 'rails.png' %>
  ```
 
 1. Check out [other asset tag helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html), and add one more of any kind (could be another image) to your asset pipeline poem.

#### Using `asset_path`

1. Use jQuery to add a click event handler to the title of the poem.  Start by logging a sanity check message in your console. Test this.

1. Update the click event handler to change the image displayed on your index page.  Use the `asset_path` helper to access the correct path for the asset from inside your JavaScript code (see [this reference in the additional reading](https://github.com/SF-WDI-LABS/shared_modules/blob/master/04-ruby-rails/asset-pipeline/27/additional-reading.md#erb-and-asset-path-helpers)).

### Stretch Challenge: SASS

 1. The `scss` at the end of Rails style files means 'sass-enabled cascading style sheets' and it gives your css [superpowers](http://sass-lang.com/). Try making your own use of some sassy superpowers:
 
   > You may have to change the extension of your files to `.scss`.

   * Nested Selectors
     ```scss
     a {
       text-decoration: none !important;
       color: black;
       &:hover {
         color:darkgrey;
       }
     }
     ```

   * Nested Properties
     ```scss
     #footer {
       border: {
         width: 1px;
         color: #ccc;
         style: solid;
       }
     }
     ```

   * Mixins
     > Mixins are like functions/methods for css.
     ```scss
     @mixin rounded($amount) {
       -moz-border-radius: $amount;
       -webkit-border-radius: $amount;
       border-radius: $amount;
     }

     .box {
       border: 3px solid #777;
       @include rounded(0.5em);
     }
     ```

   * `@import`
     > `@import` lets you break up your css into partials and include them only where they're needed.

     ```scss
     // _reset.scss

     html,
     body,
     ul,
     ol {
        margin: 0;
       padding: 0;
     }
     ```

     ```scss
     /* base.scss */

     @import 'reset';

     body {
       font: 100% Helvetica, sans-serif;
       background-color: #efefef;
     }
     ```

     > When you're using SASS, it's better to use @import instead of `*= require` manifest lines to bring your stylesheets into your `application.css`.
