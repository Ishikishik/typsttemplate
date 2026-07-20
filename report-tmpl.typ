#import "@preview/rexllent:0.3.0": xlsx-parser

// report-tmpl.typ

#let main(
  title: "レポートタイトル",
  affiliation: "電気通信大学Ⅱ類",
  student-id: "",
  author: "氏名",
  experiment-date: "",
  submit-date: "",
  cover-pdf: "data/cover.pdf",
  body,
) = {
  set page(
    paper: "a4",
    margin: (top: 25mm, bottom: 25mm, x: 25mm),
    numbering: "1",
    number-align: center,
  )



    // 表紙PDFを先頭に入れる
  if cover-pdf != none {
    pagebreak(weak: true)
    image(cover-pdf, width: 100%)
    pagebreak()
  }

 set table(
  inset: (x: 0.8em, y: 0.6em),
  stroke: none,
)

set table.hline(
  stroke: 0.6pt,
)

set table.vline(
  stroke: 0.6pt,
)

show figure.where(kind: table): set figure.caption(position: top)


 set text(
  lang: "ja",
  region: "jp",
  font: (
    "Hiragino Mincho ProN",
    "Times New Roman"
  ),
  size: 11pt,
)
  set par(
    first-line-indent: 1em,
    justify: true,
    leading: 0.7em,
  )

  set heading(numbering: "1.1")
  show heading: set text(font: "Hiragino Sans", weight: "medium")

  show heading.where(level: 1): set block(
    above: 1.8em,
    below: 1em,
  )

  show heading.where(level: 2): set block(
    above: 1.4em,
    below: 0.8em,
  )

  set math.equation(numbering: "(1)")

  show math.equation: set block(
    above: 1em,
    below: 1em,
  )

  align(center)[
    #text(
    font: "Hiragino Mincho ProN",
    size: 18pt
    )[#title]

    #v(1.5em)

    #affiliation \
    #if student-id != "" [
      #student-id #author
    ] else [
      #author
    ]

    #v(1.5em)

    #experiment-date 実験 \
    #submit-date 提出
  ]

  v(2.5em)


  body
}