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

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_kana_name     | string | null: false               |
| first_kana_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_info       | text       | null: false                    |
| item_price      | int        | null: false                    |
| category_id     | int        | null: false                    |
| condition_id    | int        | null: false                    |
| shipping_fee_id | int        | null: false                    |
| prefecture_id   | int        | null: false                    |
| duration_id     | int        | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| prefecture_id  | int        | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| record         | references | null: false, foreign_key: true |

### Association

- belongs_to :record

## recordsテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- belongs_to :item
- has_one :address