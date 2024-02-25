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
has_many :comments
has_one  :buyers


# items

|      Column       |  Type   |   Options   |
|-------------------|-------- |-------------|
|name               |string   |null:false   |
|price              |integer  |null:false   |
|description        |text     |null:false   |
|comment            |text     |             |
|condition_id       |string   |null:false   |
|cost_id            |string   |null:false   |
|day_id             |string   |null:false   |
|purchase_history_id|string   |null:false   |
|user               |reference|null:false,foreign_key: true|

belongs_to :user
belongs_to :purchase_history
has_many :pictures


# buyers

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|postcode        |string   |null:false   |
|prefecture      |string   |null:false   |
|city            |string   |null:false   |
|buildingname    |string   |             |
|phonenumber     |string   |null:false   |
|user            |reference|null:false,foreign_key: true|

belongs_to :user


# pictures

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|picture         |string   |null:false   |
|item            |reference|null:false,foreign_key: true|

belongs_to :item


# purchase_history

|     Column     |  Type   |   Options   |
|----------------|---------|-------------|
|name            |string   |null:false   |
|history         |string   |             |

has_many :items