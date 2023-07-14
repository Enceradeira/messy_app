# The Messy App
This is a ruby kata exploring coupling & cohesion in a typical messy app. There are two parts. In task 1 we make a change to an app where little consideration to coupling & cohesion has been given. In task 2 we make the same change in a version of the app where coupling is much lower and cohesion higher.

## Introduction
Welcome to the Messy Cooperation Kata. Messy Cooperation is a leading provider of financial services. They recently created a new investment portal where people can buy and sell shares.

So far the following is implemented:
- Any user can sign up and become an investor on the platform
- Any user having a passcode can sign up and become an admin-user
- Users can login and logout
- Users can manage their profile
- Admin-users can generate passcodes
- Admin-users can see a list of all registered users
- Admin-users can generate passcodes
- Investors can buy shares or stocks
- Investors can see they value of their portfolio
- Investors can see their outstanding fees
- Investors can see news regarding investments
- Accountants can see outstanding fees

## Task 1
Management has now decided, in order to comply with regulations, that a history of all personal data has to be kept in the system.
This means, whenever a user changes its name or address a 'valid_from' date is recorded. In most cases the new name
or address then is only shown after that date has passed. Because the users are from all over the world, the date of
their address change also influences financial calculations, like the conversion rate to the currency where their reside.

Management has spoken about this requirement with the developers of the system but they said that the system has never been designed for such far reaching changes. They just laughed and walked away.

Your team has now been contracted to sort this mess out. Thankfully the developers left a test suite behind which has already been
extended to cover the new requirements. Your task is now to make these new tests pass. To start with it make sure you have 
switched to the branch `messy` and run the tests. For more help see the section [Getting Started](#getting-started) below.

## Task 2
In an alternative reality the same new requirements were presented to the developers. But in this reality, they said they are happy to implement it, some said they think it will only affect one particular part of the system and it won't take too long.

Because the developers think that it doesn't affect the core logic your team was now brought in to sort it out. To start with it make sure 
you have switched to the branch `modularized` and run the tests. For more help see the section [Getting Started](#getting-started) below.


## Getting Started
### Prerequisites
If you use [asdf](https://asdf-vm.com/) and [direnv](https://direnv.net/) you can just run `direnv allow` and you are good to go.

Otherwise please ensure:
- You have right ruby installed (as listed in [.tool-versions](.tool-versions)).
- You set set the `SCHEMA` environment variable with `export SCHEMA=db/schema.rb` or add it to all your `rake db:*` tasks.

Run:

`$ bundle install`

`$ rake db:create db:migrate`

`$ rspec`

You should now see a couple of failing tests. Your task is now to make those tests pass by implementing the new requirements.

