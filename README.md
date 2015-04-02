# Spree RefineryCMS Authentication gem

This gem allows [Spree 3.0+](http://spreecommerce.com/) and [Refinery CMS 3.0+](http://refinerycms.com/) to share the same authentication system (Devise).

## Installation

Create a new RefineryCMS application:

    gem install refinerycms
    refinerycms refinery_spree

> **Note:** DON'T install the gem `refinery_authentication`. The authentication is provided by Spree and included in the gem `spree_auth_devise`.

Add Spree and those gems to your Gemfile:

```ruby
gem 'spree', github: 'spree/spree', branch: '3-0-stable'
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'
gem 'spree-refinerycms-authentication', github: 'bricesanchez/spree-refinery-authentication', branch: '3-0-stable'
```

Run bundler, then install Spree

    bundle
    rails g spree:install

Then, put those lines in config/routes.rb to use RefineryCMS and Spree together and remove routes conflicts

```ruby
root :to => "refinery/pages#home"
mount Spree::Core::Engine, :at => '/shop'
mount Refinery::Core::Engine, at: '/'
```

> **Note:** If you try to mount both engines `at => '/'`, Refinery will try to display a page even if you request a Spree page. Every page load will be slow.

Create a Spree admin user

    bundle exec rake spree_auth:admin:create

All done! Now start your application.

You should now be able to access Refinery admin at [http://localhost:3000/refinery](http://localhost:3000/refinery) and Spree admin at [http://localhost:3000/shop/admin](http://localhost:3000/shop/admin).