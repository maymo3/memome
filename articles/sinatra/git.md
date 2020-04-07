---
title_ja: gitを使う
date: 2020-03-29
---
参考：[Getting Started - First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
[デプロイ！](https://tutorial.djangogirls.org/ja/deploy/)

## gitをインストールする
gitをダウンロードする
公式サイト：[https://git-scm.com](https://git-scm.com/)

## そのOSで初めてgitを使うとき
自分のユーザ名とメールアドレスを設定する

```shell
$ git config --global user.name "Your Name"
$ git config --global user.email youremail@address.com
```

設定した情報と設定ファイルのある場所を確認する

``` shell
$ git config --list --show-origin
```

## gitを有効にする
プロジェクトディレクトリに移動する

``` shell
$ cd
$ cd MyProject
```

gitを有効にする

``` shell
$ git init
```

## 変更を記録したくないファイルを無視させる
参考：[.gitignore の書き方](https://qiita.com/inabe49/items/16ee3d9d1ce68daa9fff)

プロジェクトディレクトリ直下に`.gitignore`という名前のテキストファイルを作る。

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="far fa-file fa-fw"></i>.gitignore</li>
        </ul>
    </li>
</ul>

<p class="code-label">.gitignore</p>

```
.DS_Store
.sass-cache/
vendor/
```

## ファイルの状態を確認する

``` shell
$ git status
```
未追跡(変更を記録することにしていない)ファイルが赤色で表示される。

## 新しいファイルの追跡を開始する

``` shell
$ git add -A
```
オプション -A allの略。すべてのファイル

``` shell
$ git status
```
追跡しているファイルが緑色で表示される。

## はじめてのコミット

``` shell
$ git commit -m "My first commit"
```

``` shell
$ git commit -m "どこをどう変更したのか"
```