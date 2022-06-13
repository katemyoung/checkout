# Checkout CL app


## How to run and test this application 


### To run the linter (Standard)

Run `bundle install` from the app's directory in the terminal to install the necessary gems.

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
Implement a checkout system that fulfils these requirements/

```
| Input (Basket)  | Output (Total price expected) | Status |
| ---             | ---                           | ---    | 
| 001,002,003     | £66.78                        | ---    | 
| 001,003,001     | £36.95                        | ---    |
| 001,002,001,003 | £73.76                        | ---    | 
```


## How I approached this challenge

- [x] Initiated repo with git and RSpec 
- [ ] Used bundle to install "Standard" linter, and ran linter before every commit
- 
