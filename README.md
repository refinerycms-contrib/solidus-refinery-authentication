# Spree RefineryCMS Authentication gem

[Spree 2.3+](http://spreecommerce.com/) has a fantastic pluggable authentication system. This gem configures Spree
to use the built in (Devise) authentication in [RefineryCMS 3.0+](http://refinerycms.com/), and allows you to share
authentication between the two engines.

## Installation

Create a new RefineryCMS application:

    gem install refinerycms
    refinerycms refinery_spree
    
Add Spree and this gem to your Gemfile:

```ruby
gem 'spree', github: 'spree/spree', branch: '2-3-stable'
gem 'spree-refinerycms-authentication', github: 'bricesanchez/spree-refinery-authentication', branch: '2-3-stable'
```

> **Note:** DON'T install the gem `spree_auth_devise` otherwise the authentication on Spree will fail. The authentication is provided by RefineryCMS and included in the gem `refinerycms`.
    
Run bundler, then install Spree

    bundle
    rails g spree:install
    rake railties:install:migrations FROM=spree_refinery_authentication
    
Then, put those lines in config/routes.rb to use RefineryCMS and Spree together and remove routes conflicts

```ruby
root :to => "refinery/pages#home"
mount Spree::Core::Engine, :at => '/shop'
mount Refinery::Core::Engine, at: '/'
```

> **Note:** If you try to mount both engines `at => '/'`, Refinery will try to display a page even if you request a Spree page. Every page load will be slow.

Start your application, and create a RefineryCMS user. You can then make yourself a Spree admin using the Rails console:

```ruby
rails console
> Refinery::User.first.spree_roles << Spree::Role.find_by_name("admin")
```
    
All done! You should now be able to access Refinery at [http://localhost:3000/refinery](http://localhost:3000/refinery) and Spree at [http://localhost:3000/admin](http://localhost:3000/admin).
