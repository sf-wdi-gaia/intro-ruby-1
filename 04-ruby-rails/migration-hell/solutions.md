1. `rails g migration add_author_to_recipe author:string`

1. `rails g migration remove_author_from_recipe author:string`

1. `rails g migration change_column_name_instructions_in_recipe_to_steps`
  then in the migration
  ```ruby
  rename_column :recipe, :instructions, :steps
  ```
1. `rails g remove_posted_from_recipe`
  `rails g add_posted_to_recipe posted:datetime`

1. `rails g model comment`

1. `rails destroy model comment`
