##Iam
===

I'm sure you have similar workflows and user stories across your application:

1. Login as actor 1. Add any item. Prepare it for sale: price = $1.0, type of sale = [Existing in real world], Quantity = 2.
2. Login as actor 2. Add the item to shopping cart.
3. Login as actor 3. Add the item to shopping cart.
4. Login as actor 1 and change the qauntity of the item to 1.
5. Login as actor 2. Go to Shopping Cart. Make checkout.
6. Login as actor 3. Go to Shopping Cart. Make checkout.
7. Login as actor 1. Check the qautity value.

But you don't want to click log out, click log in, fill in email and password, click submit again and again, do you?

##Features

1. Log in via user selection from list
2. Log in via typing user id
3. Log out

##Usage

Log in via user selection from list:

* press `
* click user you want to log in as

Also you may log in using user_id (e.g. 42):

* press `
* type 42
* press `

##Installation

Add gem to your gemfile:

```ruby
gem 'iam', '~> 0.3.3'
```

Generate configuration file:

```bash
rails g iam:initializer
```

##Configuration

You will get `config/iam.yml` that will suit you in 9 cases from 10:

```yml
# Amount of accounts to display for each role block
:accounts_for_each_role: 3

# Authorization provider will be used to perform log_in and log_out routines.
# You may easily extend current list of providers available. All you need
# is to implement MyProvider module and replace the setting with `my_provider` value
:authorization_provider: devise

:account:
  # This class will be used to instantiate accounts
  :class: User

  # These attributes will be shown in a row for each account
  :attributes:
  - id
  - full_name

:role:
  # This class will be used to instantiate account roles
  :class: Role

  # These attributes will be shown in a row for each role header
  :attributes:
  - name
```

All configuration params are well described and make the gem really flexible.

Also each developer can configure control keys (alt ctrl shift) to make up iam-menu show/hide combination.
These configurations are saved into cookies and you may forget these settings after first customization.

Also the gem was __totally__ disabled from usage in production environment. Thus you can sleep peaсefully ;)

##License

MIT

##Author

Yury Kaliada


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/FUT/iam/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

