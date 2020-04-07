---
title_ja: Rackを使う
date: 2020/03/26
---
参考：[Sinatra: README (Japanese)](http://sinatrarb.com/intro-ja.html)
config.ruを作る
<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>app.rb</li>
            <li><div class="marked"><i class="fas fa-gem fa-fw"></i>config.ru</div></li>
            <li><i class="fas fa-gem fa-fw"></i>Gemfile</li>
            <li><i class="far fa-file fa-fw"></i>Gemfile.lock</li>
            <li><i class="fas fa-folder-open fa-fw"></i>vendor</li>
        </ul>
    </li>
</ul>
<span></span>

## クラシックスタイルの場合
<p class="code-label">app.rb</p>
```ruby
require 'sinatra'

get '/' do
    'Hello world!'
end
```
<p class="code-label">config.ru</p>
```ruby
require './app'
run Sinatra::Application
```

## モジュラースタイルの場合
<p class="code-label">app.rb</p>
```ruby
require 'sinatra/base'

class MyApp < Sinatra::Base
    get '/' do
        'Hello world!'
    end
end
```
<p class="code-label">config.ru</p>
```ruby
require './app'
run MyApp
```

## サーバの起動
```shell
$ rackup -p 4567
```
-pオプション…ポートの指定

bundler + rackでサーバを起動
```shell
$ bundle exec rackup -p 4567
```