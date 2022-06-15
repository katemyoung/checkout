# Checkout CL app

This is a small Ruby command line app that I created as part of a tech test for a junior developer role.

The challenge was to create a checkout for an online marketplace which offers promotions at point of sale.

**Test coverage: 100% (SimpleCov)**

## How to run this application

1. In your terminal, make a local copy of this repo using `git clone https://github.com/katemyoung/checkout.git`

2. Navigate to the main directory of your new checkout repo and run `bundle install` to install the required gems.

3. Open a new irb REPL and require the app using `irb -r ./lib/product.rb`.

4. Create some product objects for the online marketplace using the following syntax: `Product.new(product code, name, price)`,
 e.g `Product.new(001, "Lavender heart", 9.25)`

To create a set of sample products, paste the following code into the irb REPL:

```
Product.new(001, "Lavender heart", 9.25)
Product.new(002, "Personalised cufflinks", 45.00)
Product.new(003, "Kids T-shirt", 19.95)
```

5. Create a new checkout using `co = Checkout.new(promotional_rules)`, passing it some promotional rules as an argument.
The following promotional rules are available, and need to be passed in symbol form. You can pass in one promotion, both or none!
- If you spend over £60, then you get 10% off your purchase. `:ten_percent_off_over_60_pounds`
- If you buy 2 or more lavender hearts, then the price drops to £8.50. `:lavender_heart_multibuy`
-  If you don't want to apply any promotional rules, you can simply leave them out e.g. `co = Checkout.new`

6. You are now ready to `scan` some items in your checkout and find out the `total` price. Use the following code, and passing in the product code of each item e.g. 

```
co.scan(001)
co.scan(002)
price = co.total
```

## How to test this application

1. Having used `bundle install` to install the required gems, you can run the RSpec test suite from the app's main directory using the `rsepc` command.


### To run the linter (Standard)

To lint the file, run `bundle exec standardrb`


## How I approached this challenge

- [x] Initiated repo with git and RSpec 
- [x] Used bundler to install necessary gems for convenience
- [x] Took a test-driven approach, working in small steps, guided by my error messages
- [x] Refactored to short, readable methods using Single Responsibility Principle
- [x] Refactored the responsibility for storing products details to a new class, Product
following the Separation of Concerns principle.

## What I might do next 

If I continued working on this app, I might refactor the promotional rules into their own class.
I would also continue working on refactoring the test suite, to try and use test doubles and FactoryBot. 
