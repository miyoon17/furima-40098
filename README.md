# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# users

|     Column     |  Type  |   Options   |
|----------------|--------|-------------|
|nickname        |string  |null:false   |
|email           |string  |null:false   |
|password        |string  |null:false   |
|lastname        |string  |null:false   |
|firstname       |string  |null:false   |
|lastname_kana   |string  |null:false   |
|firstname_kana  |string  |null:false   |
|birtheday       |date    |null:false   |
|rule            |text    |             |

has_many :items
has_one  :buyers


# items

|     Column     |  Type   |   Options   |
|----------------|-------- |-------------|
|name            |string   |null:false   |
|price           |string   |null:false   |
|description     |string   |null:false   |
|condition       |string   |null:false   |
|cost            |string   |null:false   |
|day             |string   |null:false   |
|user_id         |reference|null:false,foreign_key: true|

belongs_to :user
has_many :pictures


# buyers

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|lastname        |string   |null:false   |
|firstname       |string   |null:false   |
|lastname_kana   |string   |null:false   |
|firstname_kana  |string   |null:false   |
|postcode        |string   |null:false   |
|prefecture      |string   |null:false   |
|city            |string   |null:false   |
|buildingname    |string   |             |
|phonenumber     |string   |null:false   |
|user_id         |reference|null:false,foreign_key: true|

belongs_to :user


# pictures

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|picture         |string   |null:false   |
|item_id         |reference|null:false,foreign_key: true|

belongs_to :item