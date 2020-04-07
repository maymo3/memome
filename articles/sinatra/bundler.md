---
title_ja: bundlerを使う
date: 2020/03/25
---

## bundlerをインストールする

```shell
$ sudo gem install bundler --no-doc
```

プロジェクトディレクトリでbundlerを使うことを表明する

```shell
$ bundle init
```

プロジェクトディレクトリにGemfileが生成される

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>app.rb</li>
            <li><div class="marked"><i class="fas fa-gem fa-fw"></i>Gemfile</div></li>
        </ul>
    </li>
</ul>

## Gemfileを編集する

<span class="add">の部分をGemfileに追記する</span>

<p class="code-label">Gemfile</p>

<pre><code class="ruby hljs"># frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

\# gem "rails"
<span class="add">gem 'sinatra'</span>
<span class="add">gem 'sinatra-contrib'</span>
<span class="add">gem 'slim'</span>
<span class="add">gem 'sass'</span></code></pre>

## gemをインストールする

gemのインストール場所を設定する

``` shell
$ bundle config set path 'vendor/bundle'
```

gemをインストールする

```shell
$ bundle install
```
指定した<code>vendor/bundle</code>ディレクトリが作られ、その配下にgemがインストールされる。
インストールしたgem一覧を記録する<code>Gemfile.lock</code>が生成される。

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>app.rb</li>
            <li><i class="fas fa-gem fa-fw"></i>Gemfile</li>
            <li><div class="marked"><i class="far fa-file fa-fw"></i>Gemfile.lock</div></li>
            <li><div class="marked"><i class="fas fa-folder-open fa-fw"></i>vendor</div></li>
        </ul>
    </li>
</ul>

## bundlerを使ってサーバを起動する
※ipアドレスは一例

```shell
$ bundle exec rackup -o 192.168.33.10
```