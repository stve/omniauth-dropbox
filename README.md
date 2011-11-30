OmniAuth Dropbox
================

This gem is an OmniAuth 1.0 Strategy for the [Dropbox API](https://www.dropbox.com/developers)

It supports version 1 of the Dropbox API which uses OAuth 1.0a.

Usage
-----

Add the strategy to your `Gemfile` alongside omniauth:

```ruby
gem 'omniauth'
gem 'omniauth-dropbox'
```

Then integrate the strategy into your middleware:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox, ENV['DROPBOX_KEY'], ENV['DROPBOX_SECRET']
end
```

You will have to put in your consumer key and secret (Dropbox refers to them as App Key and App Secret).

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2011 Steve Agalloco. See [LICENSE](https://github.com/spagalloco/omniauth-dropbox/blob/master/LICENSE.md) for details.