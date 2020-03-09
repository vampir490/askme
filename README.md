<h1 align="center">Ovechkask</h1>

A **Ruby on Rails** application to ask and answer questions. A clone of popular application - askFM.

This is a training project as part of Ruby / Ruby on Rails coding bootcamp. It is aimed to train:
* self-coded authentification;
* using recaptcha;
* hashing passwords;
* deployment on Heroku.

## DEMO
[ovechkask.herokuapp.com](https://ovechkask.herokuapp.com/)

## Versions used
* Ruby 2.6.4
* Rails 5.2

## Installation
To use the code:
1. Download the repository using the [instruction](https://help.github.com/en/articles/cloning-a-repository).
2. In the command line go to the directory with the files downloaded.
3. Install required gems. To do that:
   1. Check if the bundler is installed with the command `gem list bundler`
      * If it is not installed - installed it with the command `gem install bundler`.
      * If bundler is already installed, that is perfect. Go to the next step.
   2. In the directory with the game, to install all necessary gems run `bundle`
4. To run migrations: 
```console
bundle exec rake db:migrate
```
5. To work on production configure your Heroku account and check the name of application in `production.rb`
