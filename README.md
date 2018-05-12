## Restauranteur

> Note: Please keep in mind that this app was meant to be a prototype a long time ago.
> I decided to opensource it to help a friend who's studying frontends.

### Setup

```bash
# Get postgresql
sudo apt-get install postgresql-9.6
# You'll need to create a postgres user matching your username.
sudo su - postgres
# Then from that user run psql and `CREATE ROLE doodloo WITH SUPERUSER LOGIN;`

# Have Ruby 2.3 and stuff:
rvm install 2.3.1
rvm use --default 2.3.1
# Have bundler too.
gem install bundler

# Fetch all dependencies.
bundle
# Create, migrate and seed the database.
rake db:drop db:create db:migrate db:seed
```

### Starting the Server

Once ready to go, you can simply run `rails s` and the app should be running
[locally](http://localhost:3000).

Here are a few credentials you can use to play with the app:

- Administrator: `admin@gmail.com` / `Passw0rd`
- Dietitian: `diet@gmail.com` / 'Passw0rd'
- Chef: `chef@gmail.com` / `Passw0rd`
- User: `user@gmail.com` / `Passw0rd`
