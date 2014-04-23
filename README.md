# Twilio Rails/Pusher Demo App

## Setup

First, create a [free Twilio account](http://twilio.com/try-twilio).

Second, create an account on [Pusher.com](http://pusher.com) and create an app. Please take note of these 3 value:

* App Id
* Key
* Secret

## Local Development

To run the app locally, you'll need to configure your local environment variables to contain your Pusher information. 

```
export PUSHER_APP=foo
export PUSHER_KEY=bar
PUSHER_SECRET=baz
```

## Pushing to Heroku

If you're deploying this app to Heroku (or another PaaS provider) you'll need to make sure the Pusher information is configured there.

```
heroku config:set PUSHER_APP=foo
heroku config:set PUSHER_KEY=bar
heroku config:set PUSHER_SECRET=baz
```

## Configuring your Twilio number

Now that the app is deployed to a public server, you can configure your Twilio number. Click on **Numbers**, click on the phone number you were assigned, and look for the **Messaging Request URL**. Paste in the URL to your Rails app, including the path `/sms`. For example:

`http://twilio-rails-pusher.herokuapp.com/sms`

## Done!

That's it! Now you can load the main page (i.e. `http://twilio-rails-pusher.herokuapp.com/twilio`) and send text messages to your Twilio number. They should appear on the page instantly, no refresh required.

