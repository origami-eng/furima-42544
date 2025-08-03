# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| date_of_birth      | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| shipping_fee_charge | string     | null: false |
| sender_area         | string     | null: false |
| price               | integer    | null: false |
| shipping_time       | string     | null: false |
| seller              | references | null: false, foreign_key: true |
### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_ordered | references | null: false, foreign_key: true |
| buyer        | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| zip_code     | string | null: false |
| state        | string | null: false |
| city         | string | null: false |
| street       | string | null: false |
| building     | string | |
| phone_number | string | null: false |

### Association

- belongs_to :address