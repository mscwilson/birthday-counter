## Birthday Greeter

This very simple app tells you how many days you have to wait until your birthday, or wishes you happy birthday if it's today.

This was a bonus challenge for week 3 of the [Makers Academy](https://makers.tech/) bootcamp.  It's written in Ruby using the Sinatra web framework. The tests are written in Rspec and Capybara.

It looks like this:
![entering details](/public/1_entering_details.png)
![bad news](/public/2_bad_news.png)
![good news](/public/3_good_news)
![happy birthday](/public/4_happy_birthday.png)

### How to install
* Install Ruby. This app was written in v3.0.0.
* Clone the repo.
* If you don't already have Bundler, get Homebrew and run `brew bundle` just to be on the safe side.
* In the cloned Birthday app folder, run `bundle`. It will install all the gems from the Gemfile.
* To run the app on a local server, use `rackup config.ru`. It will say some things including "WEBrick::HTTPServer#start: pid=84437 port=*9292*".
* Use your browser to go to `localhost:9292` or whatever port it said it was using.
* Enter your details to find out how long you have to wait until your birthday.

### Known problems
I didn't implement any checks that the entered day+month is a valid combination. The program will just stop and show an error page if it's invalid.  To do the days calculation, the model uses the current year plus user inputs to make a Date object. Since 2021 isn't a leap year, a birthday of 29th Feb causes the same invalid date error as for a completely invalid date like 31st April.
