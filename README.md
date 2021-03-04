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
| name               | string         | null: false       |
| introduction       | text           | null: false       |
| category_id        | integer        | null: false       |
| condition_id       | integer        | null: false       |
| price              | integer        | null: false       |
| delivery_fee_payer | string         | null: false       |
| place_sending_from | string         | null: false       |
| preparing_days     | integer        | null: false       |
| user               | references     | foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :prefecture

## purchases テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |
| address    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_number   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_name    | string     | null: false       |
| building      | string     |                   |
| phone_number  | integer    | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to :purchase

## categories テーブル

| Column   | Type    | Option      |
| -------- | ------- | ----------- |
| category | integer | null: false |

### Association

- has_many :items

## conditions テーブル

| Column    | Type    | Option      |
| --------- | ------- | ----------- |
| condition | integer | null: false |

### Association

- has_many :items

## prefecture テーブル

| Column     | Type    | Option      |
| ---------- | ------- | ----------- |
| prefecture | integer | null: false |

### Association

- has_many :items
