# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                | Type           | Options           |
| --------------------- | -------------- | ----------------- |
| name                  | string         | null: false       |
| introduction          | text           | null: false       |
| category_id           | integer        | null: false       |
| condition_id          | integer        | null: false       |
| price                 | integer        | null: false       |
| delivery_fee_payer_id | integer        | null: false       |
| prefecture_id         | integer        | null: false       |
| preparing_day_id      | integer        | null: false       |
| user                  | references     | foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :prefecture
- belongs_to :delivery_fee_payer
- belongs_to :preparing_day

## purchases テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| post_number   | string     | null: false               |
| prefecture_id | integer    | null: false               |
| city          | string     | null: false               |
| house_name    | string     | null: false               |
| building      | string     |                           |
| phone_number  | string     | null: false, unique: true |
| purchase      | references | foreign_key: true         |

### Association

- belongs_to :purchase
- belongs_to :prefecture
