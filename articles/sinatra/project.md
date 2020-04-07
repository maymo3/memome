---
title_ja: sinatraのプロジェクトを作る
date: 2020/03/24
---

## 作業ディレクトリを作る

``` shell
$ mkdir MyProject
$ cd MyProject
$ touch main.rb
```

<ul class="tree">
    <li><i class="fas fa-folder-open fa-fw"></i>MyProject
        <ul>
            <li><i class="fas fa-gem fa-fw"></i>main.rb</li>
        </ul>
    </li>
</ul>

ホストを指定してサーバを起動する
※ipアドレスは一例

``` shell
$ ruby main.rb -o 192.168.33.10
```
``` shell
$ mkdir views
$ touch views/example.slim
```
slimは特にrequireしなくても使える