# Authenticatable Rails 5.0 API

This example is based on tutorial: 
[Authentication With EmberJS](http://coderberry.me/blog/2013/07/08/authentication-with-emberjs-part-1/)

The tutorial was adapted for rails 5.0. It doesn't include ember.js part. All tests from tutorial are adapted and green.

This example contains only the following models:
* User
* API key

Rails app was generated with --api option.

It allows to register a new user and obtain API token that should be passed back with HTTP_AUTHORIZATION header.
When correct header is present, user is considered as logged in. 

* `ensure_authenticated_user` method can be used to protect controller actions from anonymous access.
* `current_user` method can be used to retrieve currently logged in user.