# House Selling and Buying Tracking System

A user trying to buy or sell a house, can easily do so using our application.

## Admin Username and Password (Please delete browser cookies)
###### Username - admin@ncsu.edu
###### Password - admin

#### Prerequisites

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

# While testing the application, please note:
* A user can only sign-up as a realtor or buyer.
* Once signed-up, they can navigate to Home/Log In to login with their username and password.

## Admin Module:
* An admin can view, edit, create new and destroy existing users (realtor/buyer) as seen on the Home page.
![Admin Home](https://mysterious-temple-73036.herokuapp.com/AdminHome.png?s=200)

* They can create a new company by going to List all companies -> New Company, where they can view, edit or destory existing companies.
![List Companies](https://mysterious-temple-73036.herokuapp.com/ListCompanies.png?s=200)

* They can go to List Houses to view existing listed houses and further to New House to add a new house.
![List Houses](https://mysterious-temple-73036.herokuapp.com/ListHouse.png?s=200)

* They can view all inquiries that have been asked by any buyer and also the replies by going to House Inquiries -> View Replies.
![View Inquiries](https://mysterious-temple-73036.herokuapp.com/ViewInquiries.png?s=200)

* They can view the interested buyers.
![Interested Buyers](https://mysterious-temple-73036.herokuapp.com/InterestedBuyers.png?s=200)

* They can add a house to the Intereset List which consists of the houses a user is interested in by going to List all buyers -> ADD House to interest list.
![Interest List](https://mysterious-temple-73036.herokuapp.com/AddHouseInterestList.png?s=200)


## Realtor Module:
* They can view all the companies, houses and buyers present.
* They can create a new company by going to List all companies -> New Company.
* They now will belong to this company.
* They can go to List Houses -> New House to add a new house. They will also be able to upload images regarding the property if they wish to.
* They can filter the available houses on the basis of Location, Style, Start Price, End Price. (Please make sure you enter text as mentioned in the fields listed under "List all houses.")
* They can Destroy/Edit only those houses created by them.
* One the List Houses -> House Inquiries page, he can view all the inquiries posted by buyers. He can now Reply to these.
* He can edit his Profile by going to his home page Home -> Edit.

## Buyer:
* Once someone login as a buyer, they can edit their own information.
* They can view all the existing companies.
* They can view all houses and filter them according to it's location, price and style.
* They can go to House Inquiries -> New Inquiry to create a new inquiry for a house.
* They can also view the replies given to their inquiry by going to House Inquiries -> View Replies.

