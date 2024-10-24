#import "head.typ"


#let std-bibliography = bibliography

#let template(
  lang: "ja",
  titles: (),
  fonts: (
    sans-ja: "Noto Sans JP",
    serif-ja: "Noto Serif JP",
  ),
  authors: (),
  bibliography: none,
  affiliations: (:),
  paffiliations: (:),
  ..doc,
) = {

  set text(font: (fonts.serif-ja), size: 0.8em)

  // ページ設定
  // set page(columns: 2)

  set par(justify: true)

  // セクションのタイトルの設定
  set heading(numbering: "1 ")

  // figure を設定
  set figure(supplement: "図")

  // 段落のインデントを設定
  set par(first-line-indent: 1em, spacing: 0.8em)
  show heading: it => {
    text(font: fonts.sans-ja, it)
    par(text(size: 0pt, ""))
  }
  show figure: it => {
    it
    par(text(size: 0pt, ""))
  }
  show linebreak: it => {
    it
  }

  show heading.where(level: 1): it => {
    set block(above: 1.5em, below: 0.5em)
    set text(size: 12pt, weight: 500)
    it
  }
  show heading.where(level: 2): it => {
    set block(above: 0.9em, below: 0.15em)
    set text(size: 9.2pt)
    it
  }
  show heading.where(level: 3): it => {
    set block(above: 0.9em, below: 0em)
    set text(size: 9.2pt)
    it
  }

  place(
    top + center,
    scope: "parent",
    float: true,
    head.header_title(
      font-sans: fonts.sans-ja,
      font-serif: fonts.serif-ja,
      titles: titles,
      authors: authors,
    ),
  )

  for (i, part) in doc.pos().enumerate() {
    if type(part) == content {
      columns(
        2,
        gutter: 5%,
        [
          #if i == 0 {
            hide(context {
              // 表題脚注があるケースに対応するため
              let current-counter = counter(footnote).get()

              // 所属の脚注
              counter(footnote).update(0)
              for affiliation in affiliations.values() {
                footnote(affiliation, numbering: footnote-numbering-affiliate)
              }

              // 現所属の脚注
              counter(footnote).update(0)
              for paffiliation in paffiliations.values() {
                footnote(paffiliation, numbering: footnote-numbering-paffiliate)
              }

              // 本文の脚注に戻す
              counter(footnote).update(current-counter)
            })
          }

          #v(5pt)
          #part
          #if i == doc.pos().len() - 1 {
            show std-bibliography: set text(size: 0pt)
            bibliography
          }
        ],
      )
    } else {
      part.value
    }
  }




  par(text(size: 1em, ""))

  // doc
}