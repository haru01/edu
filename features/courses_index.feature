# language: ja

フィーチャ: 授業一覧を知りたい
  講師、営業として、授業一覧を知りたい。
  なぜなら、営業は、営業する際に講師の空き状況を知りたい。請求書を出す情報を知りたい。
  講師は、授業の準備、計画に必要なため。

  背景:
    前提 講師マスタが登録されている
    前提 授業が登録されている
    | 開催日        | 場所 | 人数 | 概要説明   | 講師(主) |
    | 2011-11-01 | 島根 | 10 | UMLコース | 天野    |
    | 2011-09-01 | 島根 | 11 | TDDコース | 懸田    |
    | 2011-10-01 | 東京 | 12 | TDDコース | 家永    |
  シナリオ: 一覧
    もし 授業の一覧取得APIにアクセスしている
    ならば 授業情報が取得できていること
    | 開催日        | 場所 | 人数 | 概要説明   | ステータス | 講師(主) |
    | 2011-09-01 | 島根 | 11 | TDDコース | 予定    | 懸田    |
    かつ 登録された授業の一覧が開催日順に取得できること:
     | 開催日        |
     | 2011-09-01 |
     | 2011-10-01 |
     | 2011-11-01 |
