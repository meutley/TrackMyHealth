# TrackMyHealth

A web-based health tracking application to record and analyze personal health data over time such as blood pressure, blood glucose, weight, etc. Visually monitor trends in health data with graphs and charts.

---

## Version Information

### Ruby
2.4.3

### Rails
5.1.4

### PostgreSQL
1.0.0

---

## Running Locally
Install gems:

`bundle install`

Seed the database (SQLite)

`rails db:seed`

Start the development server

`rails server`

**Note**

I have yet to resolve an issue regarding the bcrypt gem. If you receive an error about bcrypt or bcrypt_ext after running `bundle install`, run the following commands:

`gem uninstall bcrypt`

`gem uninstall bcrypt-ruby`

`gem install bcrypt --platform=ruby`.