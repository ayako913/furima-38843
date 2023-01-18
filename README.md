# テーブル設計

## usersテーブル

| Column              | Type              | Options                  |
| ------------------- | ----------------- | ------------------------ |
| nickname            | string            | null:false               |
| email               | string            | null:false , unique:true |
| firstname           | string            | null:false               |
| lastname            | string            | null:false               |
| fistkana            | string            | null:false               |
| lastkana            | string            | null:false               |
| birthday            | string            | null:false               |
| encryptedd_password | string            | null:false               |

## Association

-has_many :items
-has_many :orders

## itemsテーブル

| Column             | Type              | Option                       |
| ------------------ | ----------------- | ---------------------------- |
| title              | string            | null:false                   |
| text               | text              | null:false                   |
| category_id        | integer           | null:false                   |
| charge_id          | integer           | null:false                   |
| prefecture_id      | integer           | null:false                   |
| day_id             | integer           | null:false                   |
| price              | integer           | null:false                   |
| user_id            | references        | null:false, foreign_key:true |

## Association

-belongs_to :user
-has_one :order

## ordersテーブル

| Column             | Type              | Option                       |
| ------------------ | ----------------- | ---------------------------- |
| user_id            | references        | null:false, foreign_key:true |
| item_id            | references        | null:false, foreign_key:true |

## Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## deliverysテーブル

| Column             | Type              | Option                       |
| ------------------ | ----------------- | ---------------------------- |
| postcode           | integer           | null:false                   |
| prefecture_id      | integer           | null:false                   |
| cityadress         | string            | null:false                   |
| adress             | string            | null:false                   |
| buildingname       | string            |                              |
| telphone           | integer           | null:false                   |
| order_id           | references        | null:false, foreign_key:true |

## Association

-belongs_to :order