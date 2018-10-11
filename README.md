# House Selling and Buying Tracking System

A user trying to buy or sell a house, can easily do so using our application.

## Admin Username and Password (Please delete browser cookies)
###### Username - admin@ncsu.edu
###### Password - admin

## While signing in use one of the below information
## Types of roles:
###### realtor
###### buyer

### Prerequisites

Please make sure you do the following once you have cloned the repository to your local machine:
1. Install postgresql on your MAC using the following command in your RubyMine Terminal.
```
brew services start postgresql
```
2. Run the following commands to get all the dependencies and migrate changes in your database.
```
bundle install
bundle update
rake db:migrate
rake db:seed
```

#### While testing the application, please note:
* A user can only sign-up as a realtor or buyer.
* Once signed-up, they can navigate to Home/Log In to login with their username and password.

## Admin Module:
* An admin can view, create, edit, and destroy companies, houses and users (realtor/buyer).


## Realtor Module:
* They can view all the companies, houses and buyers present.
* They can create a new company by going to List all companies -> New Company.
* They now will belong to this company.
* They can go to List Houses -> New House to add a new house. They will also be able to upload images regarding the property if they wish to.
* They can filter the available houses on the basis of Location, Style, Start Price, End Price. (Please make sure you enter text as mentioned in the fields listed under "List all houses.")
* They can Destroy/Edit only those houses created by them.
* One the List Houses -> House Inquiries page, he can view all the inquiries posted by buyers. He can now Reply to these.
* He can edit his Profile by going to his home page Home -> Edit.


## Preferred contact method:
###### phone
###### text
###### email

## Run the project

###### Download the zip
###### open the project in the editor
###### excecute the command 'bundle install'
###### excecute the command 'bundle update'
###### excecute the command 'rake db:migrate'
###### excecute the command 'rake db:seed'
