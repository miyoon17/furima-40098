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
has_many :buyers
belongs_to :order


# items

|      Column       |  Type    |   Options   |
|-------------------|----------|-------------|
|name               |string    |null:false   |
|price              |integer   |null:false   |
|description        |text      |null:false   |
|category_id        |integer   |null:false   |
|condition_id       |integer   |null:false   |
|cost_id            |integer   |null:false   |
|scheduled_day_id   |integer   |null:false   |
|prefecture_id      |integer   |null:false   |
|user               |references|null:false,foreign_key: true|

belongs_to :user

has_one :pictures


# buyers

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|postcode        |string   |null:false   |
|prefecture_id   |string   |null:false   |
|city            |string   |null:false   |
|address         |string   |null:false   |
|buildingname    |string   |             |
|phonenumber     |string   |null:false   |


belongs_to :order


# orders

|     Column     |  Type    |   Options   |
|----------------|----------|-------------|
|user            |references|null:false,foreign_key: true|
|item            |references|null:false,foreign_key: true|

has_many :users
has_many :buyers
belongs_to :item
