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

##Usage

Iam enables you to log in as another user in single click. All you need is to:

* press `
* click user you want to log in as

Also you may log in using user_id (e.g. 42):

* press `
* type 42
* press `

##Installation

Add gem to your gemfile:

```ruby
gem 'iam', '~> 0.1.6'
```
##Configuration

Generate configuration file:

```bash
rails g iam:initializer
```

All major configuration params available are described there.

Also each developer can configure control keys (alt ctrl shift) to make up iam-menu show/hide combination.
These configurations are saved into cookies and you may forget these settings after first customization.

##License

MIT

##Author

Yury Kaliada
