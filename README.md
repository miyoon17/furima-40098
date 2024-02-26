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
|last_name          |string  |null:false   |
|first_name         |string  |null:false   |
|last_name_kana     |string  |null:false   |
|first_name_kana    |string  |null:false   |
|birthday         |date    |null:false   |

has_many :items
has_many :orders


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

has_one :order


# buyers

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|post_code       |string   |null:false   |
|prefecture_id   |string   |null:false   |
|city            |string   |null:false,foreign_key: true|
|address         |string   |null:false,foreign_key: true|
|building_name   |string   |null:false,foreign_key: true|
|phone_number    |string   |null:false,foreign_key: true|


belongs_to :order


# orders

|     Column     |  Type    |   Options   |
|----------------|----------|-------------|
|user            |references|null:false,foreign_key: true|
|item            |references|null:false,foreign_key: true|

belongs_to :users
has_one :buyer
belongs_to :item
