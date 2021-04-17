# アプリ概要
ギタリストのための技術共有サイト。  
日々の練習のアウトプットやアドバイス、Youtubeの動画などを紹介しあってモチベーションの維持にお役立てください。  

# なぜ作ったか
あるギターメーカーのデータによると、ギター初心者の9割が1年以内に挫折しているらしい。
その原因は、仲間がいない・練習方法が分からない・上達の実感が沸かないなど。
このアプリがギタリストの皆さんの一助となれば幸いです。

# 本番環境
https://ggwp-guitar.herokuapp.com/

画面右部のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。
起動時は少々重いです。しばらくお待ちください。

# 使用技術

* Ruby 2.5.3

* Ruby on Rails 5.2.4

* MySQL 5.7

* AWS
    * cloud9
    * S3

* heroku

* sendgrid

# 機能一覧

* ユーザ登録・ログイン機能 (devise)
    * アバター登録(Active Storage + S3)
    * フォロー機能

* 投稿機能
    * YoutubeのURLを自動変換し、埋め込み動画として表示
    * 画像投稿機能(Active Storage + S3)
    * コメント機能
    * いいね機能
    * ページネーション機能(kaminari)

# デモ
  * 投稿機能
  * コメント機能
  * いいね機能
  * フォロー機能

# なぜ作ったか？

ギタリスト同士で情報共有を図ることで、挫折する人を減らし、技術の向上を図ってほしいため。
ギターを新規で始める人の9割は1年以内に挫折してしまう、というデータがあるほど挫折率が高い。
特に独学で仲間もいないとその割合が高くなる。
取得した技術の備忘録やおすすめの動画の共有、ギタリスト同士の交流に活用してほしい。
