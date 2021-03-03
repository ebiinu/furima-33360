# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type           | Options           |
| ------------------ | -------------- | ----------------- |
| image              | active_storage |                   |
| name               | string         | null: false       |
| introduction       | text           | null: false       |
| category           | string         | null: false       |
| condition          | string         | null: false       |
| price              | integer        | null: false       |
| delivery_fee_payer | string         | null: false       |
| place_sending_from | string         | null: false       |
| preparing_days     | integer        | null: false       |
| seller             | references     | foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| buyer      | reference  | foreign_key: true |
| item_id    | references | foreign_key: true |
| address_id | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_number  | string  | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| house_name   | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- has_many :purchases