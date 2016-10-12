# README

Application is a converter of USD to EUR using preloaded exchange rates

### Technologies

- Ruby 2.3.1
- Rails 5.0.0.1
- Postgresql 9.3
- Rspec 3.5

### Setup 

Run: ```rake db:setup```
To start server run ```rails s```

For data import there is a rake task created

```rake db:import_rates_csv[filename]``` 
where filename is a path to your file

```rake db:seed``` seeds the database with test data 
from lib/assets/exchange_rates.csv

### Notes
#### General

Application has one form with date select fiesld, amount field and button
calculate.

User can choose a date to which he wants to convert USD to EUR and amount.
Date by default is set to latest date present in a database

If user coose a date for which there is no exchange rate in the database he will
see flash with error message.

User also can not set negative number of USD.

####Technical

I choose Postgresql as a database do to its maintainability, it would be easy to
change ar add new tables to it unlike NoSQL databases like redis.

Redis might be slightly faster but for given number of data ~ 3000 there would
be no significant difference.

Application has one model - ExchangeRate with two fields date, and rate.
Date is a specific day, to which user wants to convert money, rate is exchange
rate for this date.

Both date and rate fields are required to be present, date is also set to be
uniq. It is guarantied on the database level by index, and by validations on app
side.

ExchangeRates controller has 2 actions: #index - responsible for showing form and
result to a user, and #calculate - responsible for coverting USD to EUR.

Calculate action might be implemented using ajax call, which can make app more
reponsive but was not required in specification.

All the logic is moved from controller to servces, like Calculator, RateFinder,
Importer.
Those services are responsible for finding ExchangeRate for a given date, and
converting given amount from USD to EUR.
Such approach allows to split business logic into SOLID classes and use unit
teting instead of integrational test.

Import::CsvParser service is parsing csv files and pulls only dates and rates
out of it.
It expects date to be in descending order like '2015-12-31', '2015-12-30' etc.
Date format itself is not important.
Import::Importer serviceis responsible for creation records in database, using
parsed data.
Do to a fact that ExchangeRate#date should be unique, it checks wether date
already exists in a database and if does - updates it, otherwise - creates a new
record.
I am using temporary table for this purpose, but in postgresql 9.5 there is an
option to use ON CONFLICT option.

Pure sql is used to write data to a database instead of ActiveRecord to speed up
the process.

#### Timing
- Creating basic sceleton, database, ExchangeRate model took        ~ 1.5 hours
- Creating ExchangeRatesController with index and exchange methods, 
  proper form handling                                              ~ 1.5 hour
- Importing Exchange Rates from csv                                 ~ 3 hours
- Testing and debugging                                             ~ 2 hours
- Writing README                                                    ~ 1 hour
