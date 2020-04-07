---
title_ja: Herokuを使う
date: 2020/03/31
---
## はじめに
プロジェクトはgitで管理する必要がある
参照：[gitを使う](git)

Herokuの会員登録をする
日本語ページ：[https://signup.heroku.com/jp](https://signup.heroku.com/jp)

## Heroku CLIのインストール
ターミナルでherokuコマンドを使えるようにするCLI(コマンドラインインターフェイス)をインストールする。
インストーラのダウンロード：[Getting Started on Heroku with Ruby](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up)

またはHomebrewでインストールする

``` shell
$ brew install heroku/brew/heroku
```

## SSH公開鍵がなければ作る
参考：[HerokuでSSH公開鍵(public key)を登録する方法(と削除して再登録する方法)](http://blog.infinity-dimensions.com/2012/02/heroku-public-key-add.html)

### SSH公開鍵があるか確認する
参考：[Gitサーバー - SSH 公開鍵の作成](https://git-scm.com/book/ja/v2/Git%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-SSH-%E5%85%AC%E9%96%8B%E9%8D%B5%E3%81%AE%E4%BD%9C%E6%88%90)

``` shell
$ cd ~/.ssh
$ ls
```
ホームディレクトリの直下にある`.ssh`ディレクトリ内に、`id_dsa`または`id_rsa`のような名前のファイル(公開鍵)と、同名で`.pub`拡張子が付いたファイル(秘密鍵)があれば、新たに鍵を作る必要はない。

### 鍵を作る
参考：[GitHubでssh接続する手順~公開鍵・秘密鍵の生成から~](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)

``` shell
$ ssh-keygen -t rsa
```
入力を求められる
1回目：ファイル名をid_rsa以外にする場合は入力
2回目：パスフレーズを入力
3回目：パスフレーズを再度入力
必要ない場合はすべてEnterを押す。
これで`id_rsa`と`id_rsa.pub`ができた。

## herokuのアカウントにログインする

``` shell
$ heroku login
```
自動的にブラウザでログインページが開くので、メールアドレスとパスワードを入力してログインする。

## ファイルの配置の確認

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>app.rb</li>
            <li><i class="fas fa-gem fa-fw"></i>config.ru</li>
        </ul>
    </li>
</ul>

プロジェクトのルートディレクトリにアプリ本体のファイルがあることを確認する。
また、同じくルートディレクトリに`config.ru`を置く必要がある。
参照：[Rackを使う](rack)

クラシックスタイルでの最低限のconfig.ru

<p class="code-label">config.ru</p>

```ruby
require './app'
run Sinatra::Application
```

プロジェクトで使っているgemはすべてbundlerで管理できるよう、`Gemfile`に書き出す。
参照：[bundlerを使う](bundler)

Gemfileの例

<p class="code-label">Gemfile</p>

``` ruby
source "https://rubygems.org"

gem 'sinatra'
gem 'slim'
gem 'sass'
```

## Procfileを作る
参考：[Preparing a Codebase for Heroku Deployment](https://devcenter.heroku.com/articles/preparing-a-codebase-for-heroku-deployment)

ローカル開発時に手動で打っていたアプリを起動するコマンドを、Herokuに自動で実行してもらえるようにする。

プロジェクトディレクトリ直下に`Procfile`という名前のテキストファイルを作る

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>app.rb</li>
            <li><div class="marked"><i class="far fa-file fa-fw"></i>Procfile</div></li>
            <li><i class="fas fa-gem fa-fw"></i>config.ru</li>
        </ul>
    </li>
</ul>

<p class="code-label">Procfile</p>

```
web: bundle exec ruby app.rb -p $PORT
```
`rackup`ではなくアプリを直接起動する`ruby app.rb`のように書く。
webアプリを起動するコマンドには`web:`というプロセスタイプを付ける。

## Heroku上にアプリを作る
プロジェクトディレクトリで`heroku create アプリ名`する。

```shell
$ heroku create kokoni-app-name
```
アプリ名はアクセスするときのURL`https://kokoni-app-name.herokuapp.com`
のように入る。
アプリ名が他と被ると

``` shell
Name kokoni-app-name is already taken
```
みたいに怒られるので使用可能なアプリ名で再度実行する。
アプリ名を省略すると適当な名前が自動で割り振られる。

## Herokuにプロジェクトの内容を送信する

``` shell
$ git push heroku master
```