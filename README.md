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

|     Column       |  Type  |   Options   |
|------------------|--------|-------------|
|nickname          |string  |null:false   |
|email             |string  |null:false, unique: true    |
|encrypted_password|string  |null:false   |
|lastname          |string  |null:false   |
|firstname         |string  |null:false   |
|lastname_kana     |string  |null:false   |
|firstname_kana    |string  |null:false   |
|birtheday         |date    |null:false   |

has_many :items
has_one  :buyers


# items

|      Column       |  Type   |   Options   |
|-------------------|-------- |-------------|
|image              |string   |null:false   |    
|name               |string   |null:false   |
|price              |integer  |null:false   |
|decision           |string   |             |
|description        |text     |null:false   |
|category_id        |string   |null:false   |
|condition_id       |string   |null:false   |
|cost_id            |string   |null:false   |
|scheduled_day_id   |string   |null:false   |
|prefecture_id      |string   |null:false   |
|user               |references|null:false,foreign_key: true|

belongs_to :user
belongs_to :category
belongs_to :condition
belongs_to :cost
belongs_to :prefecture
belongs_to :scheduled_day

has_one :pictures


# buyers

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|postcode        |string   |null:false   |
|prefecture      |string   |null:false   |
|city            |string   |null:false   |
|address         |string   |null:false   |
|buildingname    |string   |             |
|phonenumber     |string   |null:false   |
|user            |references|null:false,foreign_key: true|

belongs_to :user


# pictures

|     Column     |  Type    |   Options   |
|----------------|----------|-------------|
|picture         |string    |null:false   |
|user_id         |references|null:false,foreign_key: true|
|item_id         |references|null:false,foreign_key: true|


belongs_to :item
