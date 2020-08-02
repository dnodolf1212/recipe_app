
SINATRA RECIPE_APP

The Recipe_App provides a database and web interface for users to:

-Create an account to manage a user's recipes.
-A user can log-in and log-out of their account securely.
-Each user can modify their own content in each recipe and the app secures each individual account.
-A user can create, read, update and delete any of their individual recipes.

This app was built with Sinatra, extended with [Rake tasks](https://github.com/ruby/rake) for working with an SQL database using [ActiveRecord ORM](https://github.com/rails/rails/tree/master/activerecord).

USAGE
Check out the repo and run ```bundle install``` to install Ruby gem dependencies.

You can start one of Rack's supported servers using the [shotgun](https://github.com/rtomayko/shotgun) command ```shotgun```	You can start one of Rack's supported servers using the [shotgun](https://github.com/rtomayko/shotgun) command ```shotgun``` and navigate to `localhost:9393` in your browser.

Shotgun can be used as an alternative to the complex reloading logic provided by web frameworks or in environments that don't support application reloading.

MODEL CLASSES

The Recipe_App database includes two models: User and Recipe. The User model stores the user attributes user_name and email. The Recipe model stores a users recipe attributes. A recipe has a title, description, ingredients and instructions.

Contributing
Bug reports and pull requests are welcome on GitHub at  https://github.com/dnodolf1212/recipe_app


This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/dannyd4315/worlds-best-restaurants-cli-gem/blob/master/contributor-covenant.org) code of conduct.

License
The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).