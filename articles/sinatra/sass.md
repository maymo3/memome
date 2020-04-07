---
title_ja: sassを使う
date: 2020-03-28
---
参考：[sass / ruby-sass](https://github.com/sass/ruby-sass)

Rackに対応しているWebフレームワーク(sinatra含む)では以下の方法でgem 'sass'を使うことができる。

## gemをインストールする
まずはgemをインストールする。

``` shell
$ gem install sass
```
bundlerを使用している場合は、

<p class="code-label">Gemfile</p>

``` ruby
gem 'sass'
```
をGemfileに追記して

``` shell
$ bundle install
```

## config.ruに設定を書く

<p class="code-label">config.ru</p>

```ruby
require 'sass/plugin/rack'
use Sass::Plugin::Rack
```

## sassを置くディレクトリを作る
<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>My Project
        <ul>
            <li><i class="fas fa-folder-open fa-fw"></i>public
                <ul>
                    <li><i class="fas fa-folder-open fa-fw"></i>stylesheets
                        <ul>
                            <li><i class="fas fa-folder-open fa-fw"></i>sass
                                <ul>
                                    <li><i class="fab fa-sass"></i>style.sass</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
</ul>
`public/stylesheets/sass`に置いたすべてのsassファイルが、リクエストの度に`public/stylesheets`以下のcssファイルに変換される。
例えば`public/stylesheets/sass`に`style.sass`を作った場合、`public/stylesheets`に`style.css`が生成される。