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
| birthday            | date              | null:false               |
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
| state_id           | integer           | null:false                   |
| prefecture_id      | integer           | null:false                   |
| severalday_id      | integer           | null:false                   |
| price              | integer           | null:false                   |
| user               | references        | null:false, foreign_key:true |

## Association

-belongs_to :user
-has_one :order

## ordersテーブル

| Column             | Type              | Option                       |
| ------------------ | ----------------- | ---------------------------- |
| user               | references        | null:false, foreign_key:true |
| item               | references        | null:false, foreign_key:true |

## Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## deliveriesテーブル

| Column             | Type              | Option                       |
| ------------------ | ----------------- | ---------------------------- |
| postcode           | string            | null:false                   |
| prefecture_id      | integer           | null:false                   |
| cityadress         | string            | null:false                   |
| adress             | string            | null:false                   |
| buildingname       | string            |                              |
| telphone           | string            | null:false                   |
| order              | references        | null:false, foreign_key:true |

## Association

-belongs_to :order