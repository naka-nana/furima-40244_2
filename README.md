# README

## usersテーブル

| Column	             | Type      | Options                      |
| -------------------- | --------- | ---------------------------- |
| nickname             | string    | null: false                  |
| email                | string    | null: false, unique: true    |
| birthday             | date      | null: false                  |
| first_name           | string    | null: false                  |
| last_name            | string    | null: false                  |
| first_name_kana      | string    | null: false                  |
| last_name_kana       | string    | null: false                  |

### Association
has_many :items
has_many :oder_histories


## itemsテーブル

| Column	             | Type      | Options                      |
| -------------------- | --------- | ---------------------------- |
| user_id              | references| foreign_key: true            |
| item_name            | string    | null: false                  |
| item_info            | text      | null: false                  |
| category_id          | integer   | null: false                  |
| condition_id         | integer   | null: false                  |
| shipping_id          | integer   | null: false                  |
| shipping_day_id      | integer   | null: false                  |
| price                | integer   | null: false                  |
| region_id            | integer   | null: false                  |

### Association
belongs_to :user
has_one :order_history


## order_historiesテーブル

| Column	             | Type      | Options                      |
| -------------------- | --------- | ---------------------------- |
| user_id              | references| foreign_key: true            |
| item_id              | references| foreign_key: true            |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column	             | Type      | Options                      |
| -------------------- | --------- | ---------------------------- |
| order_history_id     | references| foreign_key: true            |
| postal_code          | string    | null: false                  |
| region               | integer   | null: false                  |
| city                 | string    | null: false                  |
| address              | string    | null: false                  |
| building             | string    |                              |
| phone                | string    | null: false                  |

### Association
belongs_to :order_history