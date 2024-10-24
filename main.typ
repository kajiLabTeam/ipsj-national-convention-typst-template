#import "template/template.typ" : template
#import "@preview/roremu:0.1.0": roremu
#import "template/functinos.typ": img, tbl

#show: template.with(
  title: ("Typst を用いた", "論文のテンプレート"), 
    names: (
    (
      ja: "佐藤智",
      en: "Satoru Sato",
      group: 1
    ),
    (
      ja: "斎藤彩都",
      en: "Saito Saito",
      group: 2
    ),
    (
      ja: "山田邪馬",
      en: "Yamada Yama",
      group: 1
    ),
  ),
  affiliations: (
    (
      ja: "愛知工業大学情報科学部",
      en: "Aichi Institute of Technology",
      group: 1
    ),
    (
      ja: "愛知工業大学大学院経営情報科学研究科",
      en: "Department of Information Science",
      group: 2
    )
  ),
)

= 大見出しA
== セクションA
#roremu(232)

#roremu(232)

== セクションB
#tbl(table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [テーブル1],
) <tbl1>

#tbl(table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [テーブル2],
) <tbl2>

@tbl1 も表示できますし、@tbl2 も表示できます。

= 大見出しB
#img(
  image("images/typst.svg", width: 20%),
  caption: [イメージ],
) <img1>

@img1 を表示できます.@アデリーペンギン

= 大見出しC
#roremu(1000)

= 大見出しD
#roremu(1000)


#bibliography("refs.yml", title: "参考文献")
