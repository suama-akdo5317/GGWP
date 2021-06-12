# GGWP
このアプリは、ギタリストのための技術共有サイトです。  

<img width="628" alt="top画像" src="https://user-images.githubusercontent.com/74129169/120102356-8ae4e580-c185-11eb-956c-e06b301b296f.PNG">

「防ごうギターの置物化」がスローガンです  
日々の練習のアウトプットをしたりやアドバイスをもらったり...  
Youtubeの動画などを紹介しあってモチベーションの維持にお役立てください。
  
【URL】https://ggwp-guitar.com  
※ゲストログイン機能からお気軽にお試しください！

# なぜ作ったか
きっかけはギターに挫折してしまった友人の一言です。  
「ギター仲間がいなくて最適な練習方法も分からずモチベーションも上がらない」  
  
ギター初心者の9割が1年以内に挫折しているというデータがあります。  
原因は様々だと思いますが、私の友人のような人も多くいることでしょう。  
外出もままならない昨今、趣味としてギターを始める人も多いので、    
このアプリがギタリストの皆さんの一助となれば幸いです。  

# 使用技術
### フロントエンド
* HTML
* SCSS

### バックエンド
* Ruby 2.6.3
* Ruby on Rails 5.2.2

### インフラ
* AWS
    * EC2
    * S3
    * VPC
    * ROUTE 53
    * RDS
* Nginx
* Docker
* Docker-compose

<img width="628" alt="インフラ図" src="https://user-images.githubusercontent.com/74129169/121772911-79eb9980-cbb3-11eb-914d-8f2e0649347d.png">


# 機能一覧

* ユーザ登録・ログイン機能 (devise)
    * アバター登録(Active Storage + S3)
    * フォロー機能

* 投稿機能
    * YoutubeのURLを自動変換し、埋め込み動画として表示
 
    <img width="628" alt="動画投稿機能" src="https://user-images.githubusercontent.com/74129169/120102364-8fa99980-c185-11eb-9f84-5f150c3bb674.gif" width=70%>

    * 画像投稿機能(Active Storage + S3)
    * コメント機能
    * いいね機能
    * ページネーション機能(kaminari)


# 今後実装予定の機能
### インフラ面
* 常時SSL化 ※6/12実装しました
* Circle CI/CD の活用
* EC2、RDSの冗長化

### 機能面
* Vue.jsによるSPA化
* 検索機能
* タグ付け機能
* レスポンシブ対応

# 反省点
* 実際の開発現場を想定したissueとプルリクの活用ができなかった　※活用開始
* Twitterなどで開発日記をつけておくべきだった
* 完成までにかなりの時間を要してしまった
* RSpecによるテストまで手が回らなかった
* インフラ面含め更なる学習が必要
