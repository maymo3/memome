---
title_ja: notを使う
date: 2020-12-07
---

@notを使って、一部を除いて効果を適用する

```sass
// ===== 変数 =====
$primary-color: #00D6D6

// .linkクラスのついていないaタグがホーバー状態のとき
a:not(.link):hover
    color: $primary-color
```