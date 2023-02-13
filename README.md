# Renta
### 概要
**CtoCレンタルサービス**
### 実現したいこと
- （貸す側）　一定期間使用する予定のないものをレンタルとして出品する
- （借りる側）　購入前に商品を試用する。また、一定期間使用したい物をレンタルする。
## 技術関連
### スタック
- 開発言語：Ruby/TypeScript
- フレームワーク・ライブラリ：Ruby　on　Rails/React/Next.js
- IDaas: Firebase
- 決済Saas：　Stripe（予定）
### フロントエンドリポジトリ
https://github.com/ykuri0313/client
### 認証周り
- 認証自体は「Firebase Authorization」が行っている。
- フロントエンドはリクエスト全てにFirebase Authから取得したいidTokenを含め、APIに対して送信する
- どのリクエストに対して認証を行うかは、APIのcontrollerの`before_action`にて決定する。
<img width="973" alt="スクリーンショット 2023-02-13 19 26 30" src="https://user-images.githubusercontent.com/124572799/218433341-6bdbbc95-5292-4ee8-a313-b7c987ff544c.png">
