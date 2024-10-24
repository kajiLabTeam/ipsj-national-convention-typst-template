#let spacer(size: 0pt) = par(text(size: size, ""))

#let tbl(tbl, caption: "") = {
  figure(
    tbl,
    caption: caption,
    supplement: [表],
    kind: "table",
  )
}

#let img(img, caption: "") = {
  figure(
    img,
    caption: caption,
    supplement: [図],
    kind: "image",
  )
}
