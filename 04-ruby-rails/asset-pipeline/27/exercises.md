# Rails Asset Pipeline Exercises

## Asset Pipeline Poem

Start with the [asset pipeline poem lab](https://github.com/sf-wdi-27-28/asset_pipeline_poem).  Add on the stretch challenges below when you are finished with the poem.

## Stretch Challenges

#### Displaying Images

 1. Add an image of your choice to your `app/assets/images` folder
 2. Add that image to your view by calling the file name in an `image_tag` erb view helper.

 ```
   <%= image_tag 'rails.png' %>
 ```


####SASS

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
