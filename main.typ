#import "template.typ"
#import "@preview/roremu:0.1.0": roremu

#import "conf.typ"

#template.template(
  titles: (
    "Typst を用いた",
    "情報処理学会全国大会テンプレート",
  ),
  authors: (
    (
      name: "山田太郎",
      affiliation: "愛知工業大学情報科学部",
    ),
    (
      name: "山田花子",
      affiliation: "愛知工業大学大学院経営情報科学研究科",
    ),
  ),
  [
    = はじめに

    非公式Typst 版 情報処理学会全国大会テンプレートです。このテンプレートの利用は自由ですが、このテンプレートを利用したことによるいかなる損害についても、作者は責任を負いません。

    #figure(
      image("image.png"),
      caption: [デモ画像],
    )

    = 関連研究
    #roremu(50)@TypstTemplate

    #roremu(200)

    = 提案手法
    #roremu(400)

    #roremu(400)

    = 実験
    #roremu(400)

    #roremu(200)
  ],
  bibliography: [
    #bibliography("refs.yml", title: "参考文献")
    #conf.fake-bibliography(yaml("refs.yml"), show-unused: false)
  ],
)


