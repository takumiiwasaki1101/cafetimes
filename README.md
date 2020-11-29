# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |

### Association

- has_many :coffees
- has_many :reviews

## coffees テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| country_id      | integer    | null: false                    |
| date_of_purchase| date       | null: false                    |
| shop            | string     | null: false                    |
| detail          | text       |                                |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :reviews
- belongs_to :user

## reviews テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| date              | date       | null: false                    |
| tool_id           | integer    |                                |
| amount_of_coffee  | integer    |                                |
| amount_of_water   | integer    |                                |
| pre_infusion_time | integer    |                                |
| extraction_time   | integer    |                                |
| review            | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| coffee            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :coffee