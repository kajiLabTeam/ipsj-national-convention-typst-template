#import "functinos.typ": spacer

#let mixed(jfont, jweight: "regular", jsize: 1em, efont, eweight: "bold", esize: 1.05em, body) = {
  show regex("[\p{Latin}0-9]"): set text(font: efont, weight: eweight, size: esize)
  show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: jfont, weight: jweight, size: jsize)
  body
}


#let header_title(
  fonts: (
    sans-ja: "Noto Sans JP",
    serif-ja: "Noto Serif JP",
  ),
  title: (),
  names: (),
  affiliations: (),
  footnotes: (:),
) = {
  set align(center)

  set text(
    16pt,
    weight: 500,
  )
  mixed(
    fonts.sans-ja,
    fonts.serif-ja,
    if type(title) == "array" {
      grid(
        rows: title.len(),
        row-gutter: 8pt,
        ..title,
      )
    } else {
      grid(
        rows: 1,
        row-gutter: 8pt,
        title,
      )
    },
  )
  set text(
    8.8pt,
    weight: 100,
  )

  spacer()

  grid(
    gutter: 1em,
    columns: calc.min(names.len(), 5),
    ..names.map(author => {
      let footnote = footnotes.at(str(author.group))

      [#author.ja#super(numbering("*", footnote.index))]
    }),
  )
  grid(
    gutter: 1em,
    columns: calc.min(affiliations.len(), 5),
    ..affiliations.map(author => {
      let footnote = footnotes.at(str(author.group))

      [#author.ja#super(numbering("*", footnote.index))]
    }),
  )

  spacer()
}
