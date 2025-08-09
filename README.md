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
| category               | integer    | null: false |
| condition              | integer    | null: false |
| shipping_fee_charge    | integer    | null: false |
| state                  | integer    | null: false |
| price                  | integer    | null: false |
| shipping_time          | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee_charge
- belongs_to :state
- belongs_to :shipping_time

## purchases テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| zip_code     | string     | null: false |
| state        | integer    | null: false |
| city         | string     | null: false |
| street       | string     | null: false |
| building     | string     | |
| phone_number | string     | null: false |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
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
