#let mixed(jfont, jweight: "regular", jsize: 1em, efont, eweight: "bold", esize: 1.05em, body) = {
  show regex("[\p{Latin}0-9]"): set text(font: efont, weight: eweight, size: esize)
  show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: jfont, weight: jweight, size: jsize)
  body
}


#let header_title(
  font-sans: "Noto Sans JP",
  font-serif: "Noto Serif",
  titles: (),
  authors: (),
) = {
  set align(center)


  mixed(
    font-sans,
    font-serif,
    grid(
      rows: titles.len(),
      row-gutter: 8pt,
      ..titles.map(title => {
        text(
          16pt,
          weight: 500,
          [#title \ ],
        )
      }),
    ),
  )

  {
    set text(0pt)
    linebreak()
  }

  let count = authors.len()
  let ncols = calc.min(count, 3)

  grid(
    columns: ncols,
    gutter: 10pt,
    ..authors.map(author => [
      #author.name
    ]),
  )

  grid(
    columns: ncols,
    gutter: 16pt,
    ..authors.map(author => [
      #author.affiliation
    ]),
  )
}