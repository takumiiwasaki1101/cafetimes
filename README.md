# アプリ概要

<dl>
  <dt>名称</dt>
  <dd>カフェタイムズ</dd>
  <dt>機能</dt>
  <dd>コーヒー体験を記録する
  <dt>ターゲット</dt>
  <dd>コーヒーを豆で購入し、自身で抽出まで行う人</dd>
  <dt>解決したい課題</dt>
  <dd>「コーヒー豆データ」と「コーヒーレビュー」を一気通貫で管理する</dd>
</dl>

# 本番環境

https://www.enjoy-cafetimes.com/

ログイン情報（テスト用）
- Eメール: test@yahoo.co.jp
- パスワード: test1234 

# 制作背景（意図）

1. アプリの方向性（記録ツールの選定理由）<br>
  自身の課題としてアウトプット力の向上を掲げている。じっくりと物事を考える性格であり、行動や発言に移るまでに時間を要する傾向にある。アウトプット力を向上するためには、日々の活動（インプット）を発信（アウトプット）することが肝要である。ニュースや読書など活動のアウトプット化に取り組んでおり、今回の制作アプリもその一助になればと考えた。
  
1. ジャンルの設定（コーヒー分野の選定理由）<br>
  アウトプットをするのであれば、自身の興味のある分野に注力する方が継続する。サウナやサイクリングをはじめとする趣味の中で唯一アウトプット化が図れていないものがコーヒーであった。
  
1. 機能の選定（「コーヒー豆データ」と「コーヒーレビュー」の一括管理機能）<br>
  自身がコーヒー体験のアウトプット化に取り組んでいなかったのは、利便性の高い既存サービスがなかったからである。「コーヒー豆の購入」と「コーヒーの抽出」という異なる時間軸のアクションを一つのアプリで記録するサービスが見当たらなかった。それであれば自身で作ってしまおうと思い本アプリの作成に至った。
  
# 意識したこと

1. ペルソナマーケティング<br>
1. バックエンド<br>
1. ポートフォリオ<br>

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
