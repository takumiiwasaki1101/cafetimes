![カフェタイムズ](https://user-images.githubusercontent.com/61103261/103733037-25545900-502c-11eb-8053-776248649695.gif)

# :coffee:アプリ概要

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

# :key:本番環境

https://www.enjoy-cafetimes.com/

ログイン情報（テスト用）
- Eメール: test@gmail.com
- パスワード: test2236 

# :movie_camera:Demo

## コーヒー豆の登録機能
![コーヒー豆の登録](https://user-images.githubusercontent.com/61103261/103737912-7cf7c200-5036-11eb-97b5-46774297e4cb.gif)

## レビューの投稿機能
![レビューの投稿](https://user-images.githubusercontent.com/61103261/103738257-05766280-5037-11eb-94a8-1dfbe2c987a3.gif)

## レスポンシブデザイン
![レスポンシブデザイン](https://user-images.githubusercontent.com/61103261/103738421-4d958500-5037-11eb-8d10-8aeda0237a24.gif)

# :memo:制作背景

1. アプリの方向性（記録ツールの選定理由）<br>
  自身の課題としてアウトプット力の向上を掲げている。じっくりと物事を考える性格であり、行動や発言に移るまでに時間を要する傾向にある。アウトプット力を向上するためには、日々の活動（インプット）を発信（アウトプット）することが肝要である。ニュースや読書など活動のアウトプット化に取り組んでおり、今回の制作アプリもその一助になればと考えた。
  
1. ジャンルの設定（コーヒー分野の選定理由）<br>
  アウトプットをするのであれば、自身の興味のある分野に注力する方が継続する。サウナやサイクリングをはじめとする趣味の中で唯一アウトプット化が図れていないものがコーヒーであった。
  
1. 機能の選定（「コーヒー豆データ」と「コーヒーレビュー」の一括管理機能）<br>
  自身がコーヒー体験のアウトプット化に取り組んでいなかったのは、利便性の高い既存サービスがなかったからである。「コーヒー豆の購入」と「コーヒーの抽出」という異なる時間軸のアクションを一つのアプリで記録するサービスが見当たらなかった。それであれば自身で作ってしまおうと思い本アプリの作成に至った。
  
# :bulb:意識したこと

1. ペルソナマーケティング<br>
  アプリケーションは使われて初めて意味がある。だからこそアプリ制作に先立ち、「ターゲット」と「解決したい課題」の明確化が必須であると考えた。ターゲットは「コーヒーを豆で購入し、自身で抽出まで行う20~30代」とし、解決したい課題を「『コーヒー豆データ』と『コーヒーレビュー』の一気通貫による管理」とした。この設定は自分自身の原体験に基づいている。少なくとも自分自身が使いたいと思うアプリを作ることを意識した。
  
1. バックエンド機能の向上<br>
  アプリの根幹を担う部分であり、最終的な挙動に関わるため注力した。 **「N＋１問題を解消するSQL」** や **「AWSを用いたインフラ構築」** により通信速度の安定化を図るとともに、 **「Rspecによるバグ検知」** や **「SSL通信」** によりセキュリティの担保も確保した。
  
1. ポートフォリオとしての役割<br>
  今後、本アプリは採用担当者をはじめとする多くの人に見てもらうことを想定している。その際の入力工数が過度にならないように、「テスト用アカウントの事前作成」や「必須入力項目を極力減らすこと」を意識した。またどのようなデバイスから閲覧されても対応できるように、 **「レスポンシブデザイン」** を採用している。

# :computer:使用技術（開発環境）

## バックエンド
Ruby(2.6.5), Ruby on Rails(6.0.0)

## フロントエンド
HTML,CSS

## データベース
MySQL2(0.5.3), SequelPro

## インフラ
AWS(EC2), Capistrano

## Webサーバ(本番環境)
nginx1

## アプリケーションサーバ(本番環境)
unicorn(5.4.1)

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec(4.0.0)

## エディタ
VSCode

# :open_file_folder:DB設計

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
