## usersテーブル

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|nickname            |string |null: false              |
|first_name          |string |null: false              |
|last_name           |string |null: false              |
|first_furigana      |string |null: false              |
|last_furigana       |string |null: false              |
|birthdate           |date   |null: false              |
|email               |string |unique: true, null: false|
|encrypted_password  |string |null: false              |



### Association
- has_many :items
- has_many :purchases




## itemsテーブル

| Column                              | Type       | Options           |
| ----------------------------------- | ---------- | ----------------- |
| title                               | string     | null: false       |
| description                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| product_state_id                    | integer    | null: false       |
| delivery_charge_id                  | integer    | null: false       |
| regional_original_delivery_id       | integer    | null: false       |
| days_to_delivery_id                 | integer    | null: false       |
| price                               | string     | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase



## purchasesテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many    :addresses




## addressesテーブル

| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| postal_code              | string     | null: false       |
| city_id                  | integer    | null: false       |
| town_id                  | integer    | null: false       |
| street_id                | integer    | null: false       |
| building                 | string     |                   |
| telephone_number         | string     | null: false       |
| purchase                 | references | foreign_key: true |


### Association

- belongs_to   :purchase