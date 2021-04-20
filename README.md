## usersテーブル

|Column    |Type   |Options    |
|----------|-------|-----------|
|nickname  |string |null: false|
|name      |string |null: false|
|furigana  |string |null: false|
|birthdate |string |null: false|
|email     |string |null: false|
|password  |string |null: false|



### Association
- has_many :items
- has_many :purchases




## itemsテーブル

| Column                           | Type       | Options     |
| -------------------------------- | ---------- | ----------- |
| title                            | string     | null: false |
| description                      | text       | null: false |
| category                         | text       | null: false |
| product_state                    |            | null: false |
| delivery_charge                  |            | null: false |
| regional_original_delivery       |            | null: false |
| price                            | integer    | null: false |
| user                             | references |             |


### Association

- belongs_to :user
- has_one    :purchase



## purchasesテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user         | references |             |
| item         | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_many    :addresses




## addressesテーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| postal_code              | string     | null: false |
| city                     | string     | null: false |
| town                     | string     | null: false |
| street                   | string     | null: false |
| building                 | string     |             |
| telephone_number         | string     | null: false |


### Association

- belongs_to   :purchase