# README

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false ,unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explain       | text       | null: false                    |
| price         | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| number_id     | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery


## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order

