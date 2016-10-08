# README

Application is a converter of USD to EUR using preloaded exchange rates

### Technologies

- Ruby 2.3.1
- Rails 5.0.0.1
- Postgresql
- Rspec 

### Setup 

Run: ```rake db:setup```
To start server run ```rails s```

For data import there is a rake task created

rake db:import_rates_csv[filename] where filename is a path to your file

### Notes

#### Timing
Creating basic sceleton, database, ExchangeRate model took        ~ 1.5 hours
Creating ExchangeRatesController with index and exchange methods, 
proper form handling                                              ~ 1.5 hour
Importing Exchange Rates from csv                                 ~ 3 hours
Testing and debugging                                             ~ 2 hours

#### Technical details

Model ExchangeReate contains 2 fields: data and rate
ExchangeRatesController has 2 actions, index and calculate
All logic of finding proper ExchangeRate by date and converting USD to EUR is
moved to services.

All logic related to csv import is moved to Import servoces.

This allows using unit testing instead of abusing integration or controller's
specs

#### Possible improvement

Using redis a a databese might improve performance, but it can not make
significant difference for small amount of data, but makes app harder to
maintain.

Some integrational tests might be provided, but it required additional time do to
unexpected behaivior if Capibara gem
Also application is well covered by unit and controller specs.
