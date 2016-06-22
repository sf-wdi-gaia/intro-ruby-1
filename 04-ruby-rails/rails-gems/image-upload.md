# Upload an Image on Rails


**Resources**

* [Heroku Dev Center article on Paperclip and S3](https://devcenter.heroku.com/articles/paperclip-s3)
* [Paperclip gem docs](https://github.com/thoughtbot/paperclip)
* [Paperclip S3 Storage module docs](http://www.rubydoc.info/gems/paperclip/Paperclip/Storage/S3)
* [StackOverflow post on path and url configuration for Paperclip and S3](http://stackoverflow.com/questions/11094761/setting-up-buckets-name-placed-domain-style-bucket-s3-amazonaws-com-with-rail)
* [dotenv gem docs](https://github.com/bkeepers/dotenv)
* [AWS access key management instructions](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)
* [finding AWS API keys](http://www.cloudberrylab.com/blog/how-to-find-your-aws-access-key-id-and-secret-access-key-and-register-with-cloudberry-s3-explorer/)

### Paperclip

1. Install `imagemagick` on your computer.

  ```bash
  $ brew install imagemagick
  ```

1. Add paperclip to your Gemfile.

  ```ruby
  gem 'paperclip'
  ```

1. Add paperclip code to your `User` model.

  ```ruby
  class User < ActiveRecord::Base
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  end
  ```

  The `:styles` attribute creates various styles of images, which will be accessible later with paperclip url helpers:

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

1. Add a file field to your `users#new` form.

  ```
  <%= f.file_field :avatar %>
  ```
  Remember to add `:avatar` to `user_params`

## Image Hosting with AWS S3

This solution works locally, but in order to save images in the cloud you'll need to set up an Amazon S3 bucket. S3 will require some **secret keys**, so you'll also set up a way to use environment variables to store those secret keys.


**Never EVER check a secret key into git**

**If your key has already been checked in, even if you didn't push; go and revoke that key immediately.**
Hackers can easily scan even OLD commits for keys in minutes.

**HACKERS CAN CHARGE THOUSANDS OF DOLLARS TO YOUR AMAZON WEB SERVICES ACCOUNT IN  JUST A FEW DAYS!**

#### Hiding Secrets Option 1: environment variables

Carefully follow the instructions in our [how to hide secret keys guide](https://github.com/SF-WDI-LABS/shared_modules/blob/master/how-to/store-secrets-using-env-vars.md).

#### Hiding Secrets Option 2: `dotenv` gem

1. You will use a `.env` file to store secret environment varaibles. **Immediately, BEFORE YOU CREATE ANY NEW FILES, add a line that says `.env` to your `.gitignore`, then add and commit this `.gitignore` change.**

1. For environment variables, add the [dotenv](https://github.com/bkeepers/dotenv) gem to your `Gemfile` **before paperclip**. Then add a `.env` file to the root directory of your project.  

1. Sign into an Amazon Web Services (AWS) account and select S3. Create a new bucket. Generate a new API key, and copy both the API key id and the secret key into the `.env` file.  **PROTECT THIS API KEY -- DO NOT COMMIT TO GITHUB!!**



#### Using Secret Keys for Paperclip

1. Add your `AWS_BUCKET`, AWS_PUBLIC_KEY, and AWS_SECRET your secrets file - this will be the `.env` file if you are using the `dotenv` gem or the `secrets.sh` file if you are manually managing your secret keys.

  ```
  S3_BUCKET_NAME="your bucket name here"
  AWS_ACCESS_KEY_ID="super secret shhhhh"
  AWS_SECRET_ACCESS_KEY="do not push me to github"
  ```

  > **Remember** to add your secret key file to your `.gitignore`! Seriously.


1. Add the `aws-sdk` gem to your `Gemfile`. Don't forget to bundle.

  ```ruby
  gem 'aws-sdk'
  ```


1. In your `config/environments/development.rb` and `config/environments/production.rb`, add the following configuration for paperclip:

  ```ruby
  # Configure paperclip for uploading photos to AWS S3 bucket
  config.paperclip_defaults = {
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :url => ":s3_domain_url",
    :path => "/:class/:attachment/:id_partition/:style/:filename",
    :s3_credentials => {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      s3_region: nil
    }
  }
  ```

1. Now it should work locally! Upload a file to see it added to your bucket.

1. Push your changes to GitHub, and check your repository on GitHub. Make sure your secrets file is not in the repository.

1. **If your secret key file was accidentally checked into GitHub, FOLLOW THESE STEPS IMMEDIATELY:**

  * Deactivate and delete the current AWS keys according to [Amazon's instructions](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html).    
  * Remove the secrets file from your GitHub tracking:  `git rm .env` or `git rm secrets.sh`.  
  * Do a git commit to delete the file from git, and push to carry that change up to GitHub. Make sure every collaborator pulls down this change.   
  * **Only after you're sure your secret environment variable file  is not on GitHub**, generate new AWS keys according  to [Amazon's instructions](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html), and add them to your secrets file.  Find a secure, off-GitHub way to get your keys to each collaborator.  

### Copy Environment Variables to Heroku

1. To get this going on heroku, you need to configure environment variables on heroku's server.  Use [`heroku config:set`](https://devcenter.heroku.com/articles/config-vars) to set the `S3_BUCKET_NAME`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY` on your heroku server. (Copy these values from your `.env` file.)

1. Push your changes to heroku, and upload a file live!

## Troubleshooting

Image still not loading? Here are some things to check:

  * Is your image uploading? Check in the bucket.  
  * Are you getting an "Access Denied" error? Check that your AWS credentials are correct in your secrets file. Delete your old secret key and generate a new one, if you think you miscopied or mistyped.  
  * Are you getting other bogus stuff!?  
