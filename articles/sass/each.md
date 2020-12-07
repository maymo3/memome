---
title_ja: eachを使う
date: 2020-03-30
---

@eachを使って、マップ内のすべてのキーと値のペアを繰り返し処理する

``` sass
$icon-color: ("folder-open": #007bff,"gem": #DD004B,"file": #8b8b8b)

@each $icon, $color in $icon-color
    .fa-#{$icon}
        color: $color
```
