## Birthday Greeter

This very simple app tells you how many days you have to wait until your birthday, or wishes you happy birthday if it's today.

This was a bonus challenge for week 3 of the [Makers Academy](https://makers.tech/) bootcamp.  It's written in Ruby using the Sinatra web framework. The tests are written in Rspec and Capybara. <strong>No further development is likely for this project</strong>, it was just made to practise with Sinatra.

If you don't give a name, it will call you "stranger". I decided that the cut off for bad news/good news for impending birthday was 40 days. This of course makes a big assumption that a birthday is something the user is looking forward to. It could be fun sometime to add a second side to the app, with all different wording, for birthday-dislikers.


It looks like this:
![entering details](/public/1_entering_details.png)
![bad news](/public/2_bad_news.png)
![good news](/public/3_good_news.png)
![happy birthday](/public/4_happy_birthday.png)

### Code design
The app is built in the MVC pattern.
* There is one controller class (Birthday, in `app.rb`) which contains the Sinatra HTML routes.
* There are two view .erb files. The index page has a form with a box to fill in the user's name, and dropdowns for choosing birth day and month. The results.erb page displays two messages based on when the birthday is. There's no logic on this page, the model returns the right messages for it.
* I used `sessions` to save the form data so they can be accessed in different routes.
* The model (BirthdayCounter) uses the saved session name, day and month, along with the current year, to make a Date object.
* BirthdayCounter checks if the birthday is today and calculates the days until the birthday, and the appropriate messages based on these.

### Code highlight
I find that using Dates, Times, or Datetimes is complicated and confusing. Especially when there is a mix of month numbers and names involved. It took a while to get the calculation part of the model working, so I was particularly pleased with this method, which takes advantage of the `next_year` method for Date objects:
```ruby
  def days_until(added_year = 0)
    days = (birthdate.next_year(added_year) - Date.today).to_i
    days >= 0 ? days : days_until(1)
  end
```
The model creates a `birthdate` out of the user's entered day and month, combined with the current year. If the birthday has already happened this year, the number of days between given birthdate (eg 2021-01-05) and today's date (eg 2021-01-29) is negative. In that case, it adds one year to the birthdate (now eg 2022-01-05) and recursively calculates again.

### How to install
* Install Ruby. This app was written in v3.0.0.
* Clone the repo.
* If you don't already have Bundler, get Homebrew and run `brew bundle` just to be on the safe side.
* In the cloned Birthday app folder, run `bundle`. It will install all the gems from the Gemfile.
* To run the app on a local server, use `rackup config.ru`. It will say some things including "WEBrick::HTTPServer#start: pid=84437 port=*9292*".
* Use your browser to go to `localhost:9292` or whatever port it said it was using.
* Enter your details to find out how long you have to wait until your birthday.

* To run the tests, stop the server and run `rspec`.

### Known problems
* I didn't implement any checks that the entered day+month is a valid combination. The program will just stop and show an error page if it's invalid.
* To do the days calculation, the model uses the current year plus user inputs to make a Date object. Since 2021 isn't a leap year, a birthday of 29th Feb causes the same invalid date error as for a completely invalid date like 31st April.
* The dropdown menu lists from the form aren't styled so they don't match the other elements in size.
