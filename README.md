# Central Oregon COAD

This is the GitHub repository for the Central Oregon Community Organizations Active
in Disaster (COAD) help service system. It connects people in need with resources
made available by members of Community Organizations Active in Disaster.

## Development


Fork the repository:

```
https://github.com/ybakos/cs362-coad-resources

```

Clone your repository

```
git clone git@github.com:YOUR_GIT/cd362-coad-resources.git

```

This is a Rails application that uses SQLite in development and PostgreSQL in production.

Install the dependencies:

```
gem install bundler
bundle install
```

Copy .env.example into same diretory
```
cp .env.example .env
```

In .env update DEFAULT_PASSWORD, ADMINS, TEST_USER_EMAIL, and TEST_USER_PASSWORD

Next, set up the database:

```
rails db:setup
```

Start the app:

```
rails server
```

## Testing

This project uses RSpec for testing.

```
rspec
```

You can also run a specific directory of tests or file by supplying its name, like so:

```
spring rspec spec/path/to/file_spec.rb
```

## Deployment

This application uses [heroku for deployment](https://devcenter.heroku.com/articles/git).
Some useful commands to know can be found below.

Set up a heroku app to deploy to:

```
heroku git:remote -a coad-resources-staging
heroku git:remote -a coad-resources

```

Rename them _staging_ and _production_:

```
git remote rename coad-resources-staging staging
git remote rename coad-resources production

```

Deploy to a heroku app:

```
git push staging
```

Migrate the rails database of a heroku app:

```
heroku run rails db:migrate --remote staging
```

Seed the rails database of a heroku app:

```
heroku run rails db:seed --remote staging
```

Set environment variables (see _.env.example_ for expectations):

```
heroku config:set FOO=bar
```

## Production Dependencies

PostgreSQL
Email Server (Gmail)
Recaptcha

## Data model
![erd](public/documentation/erd.jpg?raw=true)


&copy; 2020 James Martinez, Ryder McDowell, Peter Storum, Jacob Engstrom. All rights reserved.
