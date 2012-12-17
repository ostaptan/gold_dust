== Welcome to this app

After cloning app from git you have to do next things for proper app installation:

1) you need to have ruby 1.9.3 and rails 3.2.3

2) in a command line go to the app folder and run 'bundle install'

3) create database with SQL with name 'dust_dev'

4) in a command line go to the app folder and run 'rake db:migrate'

5) now run 'rails s'

6) go to localhost:3000/ in the browser



app

  Holds all the code that's specific to this particular application.

app/assets

  Contains subdirectories for images, stylesheets, and JavaScript files.

app/controllers

  Holds controllers that should be named like weblogs_controller.rb for
  automated URL mapping. All controllers should descend from
  ApplicationController which itself descends from ActionController::Base.

app/models

  Holds models that should be named like post.rb. Models descend from
  ActiveRecord::Base by default.

app/views

  Holds the template files for the view that should be named like
  weblogs/index.html.erb for the WeblogsController#index action. All views use
  eRuby syntax by default.

app/views/layouts

  Holds the template files for layouts to be used with views. This models the
  common header/footer method of wrapping views. In your views, define a layout
  using the <tt>layout :default</tt> and create a file named default.html.erb.
  Inside default.html.erb, call <% yield %> to render the view using this
  layout.

app/helpers

  Holds view helpers that should be named like weblogs_helper.rb. These are
  generated for you automatically when using generators for controllers.
  Helpers can be used to wrap functionality for your views into methods.

config

  Configuration files for the Rails environment, the routing map, the database,
  and other dependencies.

db

  Contains the database schema in schema.rb. db/migrate contains all the
  sequence of Migrations for your schema.

doc

  This directory is where your application documentation will be stored when
  generated using <tt>rake doc:app</tt>

lib

  Application specific libraries. Basically, any kind of custom code that
  doesn't belong under controllers, models, or helpers. This directory is in
  the load path.

public

  The directory available for the web server. Also contains the dispatchers and the
  default HTML files. This should be set as the DOCUMENT_ROOT of your web
  server.

script

  Helper scripts for automation and generation.

test

  Unit and functional tests along with fixtures. When using the rails generate
  command, template test files will be generated for you and placed in this
  directory.

vendor

  External libraries that the application depends on. Also includes the plugins
  subdirectory. If the app has frozen rails, those gems also go here, under
  vendor/rails/. This directory is in the load path.
