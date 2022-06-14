# Checkout CL app

Test coverage: []%

## How to run and test this application 

**Available discounts:**

When creating a new checkout, you can select which promotions you wish to apply 
by passing the desired promotions in as an array of symbols.
If you don't wish to apply any discount, leave the argument blank.


:ten_percent_off_over_60_pounds - 
:lavender_heart_multibuy - 

e.g.


Run `bundle install` from the app's directory in the terminal to install the necessary gems.



### To run the linter (Standard)

To lint the file, run `bundle exec standardrb`

What we are looking for: functionality, efficiency, readability and tests.

Use this test to demonstrate your understanding of Ruby, OO and TDD.

- [ ] Use git to version control the code
- [ ] Avoid using any scaffolding tools
- [ ] Use a code formatter or linter
- [ ] Write unit tests where applicable
- [ ] Include instructions in a README on how to run the application and how to run the tests. 

## Specification

Our client is an online marketplace, here is a sample of some of the products available on our site:

| Product code | Name                    | Price |
| ---          | ---                     | ---     |
| 001          | Lavender heart          | £9.25   |
| 002          | Personalised cufflinks  | £45.00  |
| 003          | Kids T-shirt            | £19.95  |


Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

If you spend over £60, then you get 10% off your purchase.
If you buy 2 or more lavender hearts, then the price drops to £8.50.
Our check-out scans items in any order, and because our promotion will change, 
  it needs to be flexible regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):

```
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```
Implement a checkout system that fulfils these requirements:

```
| Input (Basket)  | Output (Total price expected) | Status      |
| ---             | ---                           | ---         |
| 001,002,003     | £66.78                        | Implemented | 
| 001,003,001     | £36.95                        | Implemented |
| 001,002,001,003 | £73.76                        | Implemented | 
```


## How I approached this challenge

- [x] Initiated repo with git and RSpec 
- [x] Used bundle to install "Standard" linter for code quality
- [x] Took a test-driven approach, working in small steps, guided by my error messages
- [x] Refactored to short, readable methods using Single Responsibility Principle


### Notes:

- refactor products into own class
- refactor methods to make more readable
- refactor test suite to isolate / decouple
- update readme how to run
- subtotal function for over 60% function
- count items function for lavender hearts
- provisional basket (pre-discount basket)
- which order should promotions run in? lavendar hearts before over 60

"Over 60 10% off" :over_60_10%
"Lavender hearts bulk discount" :multiple_lavender_hearts
Design decision: promotional rules should be passed as an array of symbols