#import "head.typ": header_title
#import "functinos.typ": spacer

#let template(
  title: (),
  names: (),
  affiliations: (),
  paper-size: "a4",
  fonts: (
    sans-ja: "Noto Sans JP",
    serif-ja: "Noto Serif JP",
  ),
  ref-path: "",
  body,
) = {
  // ドキュメントの設定
  if type(title) == "array" {
    set document(
      title: title.join(""),
      author: names.map(a => a.ja),
    )
  } else {
    set document(
      title: title,
      author: names.map(a => a.ja),
    )
  }

  // ページの設定
  set par(
    justify: true,
    spacing: 1em,
    first-line-indent: 1em,
  )
  set page(
    columns: 2,
    paper: paper-size,
    footer: align(center)[#context (counter(page).display("1"))],
  )

  set figure(
    numbering: "1.1.1",
    gap: 10pt,
  )
  show figure: it => {
    it
    spacer()
  }

  // 段落の設定
  set heading(numbering: "1.1.1")

  // 図の設定
  set figure(supplement: "図")

  // フォントの設定
  set text(
    font: (fonts.serif-ja),
    size: 0.8em,
  )

  // 1段落目の字下げ
  show heading: it => {
    text(
      font: fonts.sans-ja,
      weight: "medium",
      it,
    )
    spacer()
  }

  let footnotes = (:)
  for author in names + affiliations {
    let is_exist = footnotes.keys().contains(str(author.group))
    let index = 0

    if not is_exist {
      footnotes.insert(
        str(author.group),
        (
          index: footnotes.len() + 1,
          text: author.en,
        ),
      )
    } else {
      let text = footnotes.at(str(author.group)).text
      footnotes.insert(
        str(author.group),
        (
          index: footnotes.at(str(author.group)).index,
          text: text + ", " + author.en,
        ),
      )
    }
  }

  place(
    top + center,
    scope: "parent",
    float: true,
    header_title(
      fonts: fonts,
      title: title,
      names: names,
      affiliations: affiliations,
      footnotes: footnotes,
    ),
  )

  set footnote(numbering: "*")
  show footnote: it => text(size: 0pt, it)
  for f in footnotes {
    footnote(str(f.at(1).text))
  }

  spacer()
  body
}
