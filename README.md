# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| date_of_birth      | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| category_id            | integer    | null: false |
| condition_id           | integer    | null: false |
| shipping_fee_charge_id | integer    | null: false |
| state_id               | integer    | null: false |
| price                  | integer    | null: false |
| shipping_time_id       | integer    | null: false |
| user_id                | references | null: false, foreign_key: true |
### Association

- has_one :purchase
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee_charge
- belongs_to :state
- belongs_to :shipping_time

## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| zip_code     | string  | null: false |
| state_id     | integer | null: false |
| city         | string  | null: false |
| street       | string  | null: false |
| building     | string  | |
| phone_number | string  | null: false |

### Association

- has_one :purchase
- belongs_to :state


# ActiveHashモデル

## category

### Association

- has_many :item

## condition

### Association

- has_many :item

## shipping_fee_charge

### Association

- has_many :item

## shipping_time

### Association

- has_many :item

## state

### Association

- has_many :address
- has_many :item
