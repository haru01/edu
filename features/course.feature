# language: ja

フィーチャ: 授業の一覧を取得する
  講師として授業の一覧を取得したい
  営業として授業の一覧を取得したい

  背景:
    前提 授業が登録されている
    | 開催日        | 場所       | 人数     | 概要説明        | 講師(複数)    |
    | 2011-11-01 | 島根       | 10     | UMLコース      |           |
    | 2011-09-01 | 島根       | 11     | TDDコース      |           |
    | 2011-10-01 | 東京       | 12     | TDDコース      |           |
  シナリオ: 一覧
    もし 授業の一覧取得APIにアクセスしている
    ならば 授業情報が取得できていること
    | 開催日        | 場所       | 人数     | 概要説明        | 講師(複数)    |
    | 2011-09-01 | 島根       | 11     | TDDコース      |           |
    かつ 登録された授業の一覧が開催日順に取得できること:
     | 開催日        |
     | 2011-09-01 |
     | 2011-10-01 |
     | 2011-11-01 |
