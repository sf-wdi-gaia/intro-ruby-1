# How to Upload an Image on Rails


## Paperclip & AWS S3

[Another source](https://devcenter.heroku.com/articles/paperclip-s3)


1. Install `imagemagick` on your computer

  ```bash
  $ brew install imagemagick
  ```

1. Add Paperclip to your Gemfile

  ```ruby
  gem 'paperclip'
  ```

1. Add paperclip code to your `User` model

  ```ruby
  class User < ActiveRecord::Base
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  end
  ```

  the `:styles` attribute creates various styles of image that are accessible with these helpers:

  ```
    <%= image_tag @user.avatar.url %>
    <%= image_tag @user.avatar.url(:medium) %>
    <%= image_tag @user.avatar.url(:thumb) %>
  ```

1. Create a migration `$ rails g paperclip user avatar`

  ```ruby
  class AddAttachmentAvatarToUsers < ActiveRecord::Migration
    def up
      add_attachment :users, :avatar
    end

    def down
      remove_attachment :users, :avatar
    end
  end
  ```

1. `rake db:migrate`

1. Add a file to your users#new form

  ```
  <%= f.file_field :avatar %>
  ```
  Remember to add `:avatar` to `user_params`

1. This should work to save images now locally, but it won't work in heroku. In order to save images in heroku you'll need to setup an S3 bucket.

1. Sign into an Amazon Web Services (AWS) account and select S3. Create a new bucket. Get your API keys.  **PROTECT THIS API KEY -- DO NOT COMMIT TO GITHUB!!**

1. Add the [dotenv](https://github.com/bkeepers/dotenv) gem to your `Gemfile` and add a `.env` file to the root of your project. Now add your AWS_BUCKET, AWS_PUBLIC_KEY, and AWS_SECRET to the `.env` file.

  ```
    S3_BUCKET=buckity-bucket
    S3_PUBLIC_KEY=kafjlajdslfjalsdf
    S3_SECRET=ajsfkljaksldfjakljdflajdfljad
  ```
> **Remember** to add your `.env` file to your `.gitignore`!

1. Add the aws-sdk gem and path in paperclip

  ```ruby
  gem 'aws-sdk', '~> 1.6'
  ```

  ```ruby
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => "avatars/:id/:style/avatar.:extension",
                    :default_url => "https://s3.amazonaws.com/<<BUCKET>>/defaults/default_avatar.png"

  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end
  ```
1. Now it should work! Upload a file to see.

## Troubleshooting

Image still not loading? Here are some things to check:

  * Is your image uploading? Check in the bucket
  * Are you getting an "Access Denied" error? Check that your AWS credentials are right in your `.env` file.
  * Are you getting other bogus stuff!?
