# Face World
![表紙](app/assets/images/README.png)
<br>
[Figma](https://www.figma.com/file/8CS5ilDtB91CpvvoAxdnTm/improving_smile?type=design&node-id=0%3A1&mode=design&t=2Lil0QcGRa2ZQ86x-1)

[ER図](https://dbdiagram.io/d/65ab78eeac844320ae5436a2)
## サービスURL

ゲスト機能を実装しましたので、登録せずにお試しいただくこともできます。
https://www.face-world-app.com/

## アプリを作ったきっかけ

私が開発した「Face World」は、
ユーザーが自身の表情とそれが伝える感情を理解するためのWebアプリです。このアプリは、特に自分の表情が他人にどのような感情として伝わっているかについて疑問を持つ人々のニーズを満たすことを目指しています。このアプリのアイデアは、写真撮影のときなどに私自身が周囲から「もっと笑った方がいい」と言われるなど、自分の表情がどのような感情として他人に伝わっているのかについて疑問を感じたことから生まれました。特に、怒っているわけではないのに「怒ってる？」と聞かれた経験や、表情から誤解されることの多さに注目し、顔の表情を分析し感情を可視化するサービスを考案しました。

## アプリの特徴

ユーザーは自分の顔写真をアップロードするだけで、「喜び」「悲しみ」「怒り」などの感情要素を棒グラフで確認できます。この可視化を通じて、自分が認識していた表情が持つ感情と他人が受け取る感情のギャップに気づくことができます。これにより、ユーザーは自分の顔の表情についてより深く理解し、コミュニケーションの質を向上させることが可能です。さらに、笑顔判定機能や他ユーザーとの結果共有機能を通じて、コミュニケーションの幅を広げることができます。このアプリは、自己理解を深めると同時に、他者とのより良い関係構築を支援することを目的としたアプリとなっています。

## 機能一覧

| トップ画面 | ログイン画面 |
| ----------|----------|
|![トップ画面](app/assets/images/TopPage.png)|![ログイン画面](app/assets/images/LoginPage.png)
|登録せずにサービスをお試しいただくためのゲスト機能を実装しました。|メールアドレスとパスワードでのログイン機能を実装しました。|

| カメラ画面 | 分析画面(上部)|
| ----------|----------|
|![カメラ画面](app/assets/images/CameraPage.png) | ![分析画面上部](app/assets/images/DetectPage(1).png) |
|撮影ボタンを押した後にはプレビューが表示され、再撮影も可能になるようにカメラ機能を実装しました。|口角の上がり具合をチェック機能やぼかし機能を実装しました。|

| 分析画面（下部）|　投稿一覧画面 |
| ----------|----------|
|![分析画面下部](app/assets/images/DetectPage(2).png)|![投稿一覧画面](app/assets/images/PostindexPage.png)
|感情をグラフ化して、笑顔判定機能や目線の向きなども機能に加えました。| 撮影した顔写真とグラフが見えるようにしました。また、ページネーション機能も実装しました。|

| 投稿詳細画面 | プロファイル画面|
| ----------|----------|
|![投稿詳細画面](app/assets/images/PostshowPage.png) |![プロファイル画面](app/assets/images/ProfilePage.png)
|コメント機能やいいね機能を実装して、ユーザーの交流を促しています。|プレビュー機能を実装しました。|

## 使用技術

| Category | Technology Stack |
| ----------|----------|
| Frontend | React.js  Chasrt.js |
| Backend | Ruby, Ruby on Rails |
| Infrastructure | Heroku |
| Database | |PostgreSQL |
| Storage | AWS S3 |
|　etc. | Amazon Rekognition ESlint Rubocop Github Git |

