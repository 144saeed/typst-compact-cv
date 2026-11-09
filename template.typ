// =============================================================================
// Compact & Modular Professional CV Template
// Designed for Typst 0.11+
// Features: Dynamic Density Scaling, Dual-Level Nested Bullets, ATS Optimization
// =============================================================================

// Primary Color Palette
#let accentcolor = rgb(24, 76, 120)       // Deep Professional Navy
#let accentcolordark = rgb(16, 50, 80)     // Darkened Shade for High Contrast
#let darkgraytext = rgb(64, 64, 64)       // Primary Body Text
#let mutedgray = rgb(115, 115, 115)       // Secondary / Location Text
#let lightgray = rgb(230, 230, 230)       // Subtle Dividers

// Default Layout & Typographic Configuration
#let default-layout = (
  density: 1.0,
  accent-color: accentcolor,
  text-color: darkgraytext,
  muted-color: mutedgray,
  page-margin: (x: 0.75in, top: 0.65in, bottom: 0.65in),
  name-to-contacts-gap: 0.8em,
  contact-details-font-scale: 0.9em,
  contact-rows-gap: 0.35em,
  section-title-above: 1.4em,
  section-title-below: 0.6em,
  root-list-marker-size: 0.75em,
  root-list-body-indent: 0.5em,
  root-list-item-gap: 0.95em,
  root-list-line-leading: 0.45em,
  entry-title-to-subtitle-gap: 0.3em,
  entry-header-to-body-gap: 0.55em,
  entry-between-entries-gap: 0.95em,
  entry-list-spacing: 0.48em,
  entry-list-body-indent: 0.4em,
  entry-sublist-gap-above: 0.25em,
  entry-sublist-gap-below: 0.35em,
)

#let cv-layout-state = state("cv-layout", default-layout)

// Inline Utility Functions
#let mute(it) = context text(fill: cv-layout-state.get().at("muted-color", default: mutedgray))[#it]
#let accent(it) = context text(fill: cv-layout-state.get().at("accent-color", default: accentcolor))[#it]

// Root Document Function
#let cv(
  name: "",
  address: "",
  phones: (),
  emails: (),
  links: (),
  paper: "a4",
  font-size: 9.5pt,
  line-leading: 0.35em,
  accent-color: none,
  text-color: none,
  muted-color: none,
  layout: (:),
  body,
) = {
  let user-colors = (:)
  if accent-color != none { user-colors.insert("accent-color", accent-color) }
  if text-color != none { user-colors.insert("text-color", text-color) }
  if muted-color != none { user-colors.insert("muted-color", muted-color) }

  let active-layout = default-layout + if type(layout) == dictionary { layout } else { (:) } + user-colors
  cv-layout-state.update(active-layout)
  let d = active-layout.density

  set document(title: name + " - CV", author: name)

  set page(
    paper: paper,
    margin: active-layout.page-margin,
    footer: context {
      let page_num = counter(page).get().first()
      let total_pages = counter(page).final().first()
      align(right)[
        #text(size: 0.88em, fill: active-layout.text-color)[Page ]
        #text(size: 0.88em, fill: active-layout.accent-color, weight: "bold")[#page_num]
        #text(size: 0.88em, fill: active-layout.text-color)[ of ]
        #text(size: 0.88em, fill: black)[#total_pages]
      ]
    }
  )

  set text(
    font: ("Roboto", "Liberation Sans", "DejaVu Sans"),
    size: font-size,
    fill: black,
    lang: "en",
  )

  set par(justify: true, leading: line-leading)

  // Hyperlink Formatting
  show link: it => {
    set text(fill: active-layout.accent-color)
    underline(stroke: 0.5pt + active-layout.accent-color, offset: 1.5pt, it)
  }

  // Visual Contrast Rules
  show strong: it => text(fill: black, weight: "bold", it)
  show list: set text(fill: active-layout.text-color)

  // Top-Level Unordered Lists (Skills, Publications)
  set list(
    marker: text(fill: active-layout.accent-color, size: active-layout.root-list-marker-size)[\u{2756}],
    spacing: active-layout.root-list-item-gap * d,
    body-indent: active-layout.root-list-body-indent,
  )
  show list.item: it => {
    set par(leading: active-layout.root-list-line-leading)
    it
  }

  // Header Section
  block(width: 100%, above: 0pt, below: 0pt)[
    #align(center)[
      #v(-1.6em)
      #text(size: 2.5em, weight: "bold", fill: active-layout.accent-color)[#name]
      #{
        let contact-rows = ()
        let r1 = ()
        if address != "" {
          r1.push([#text(fill: active-layout.accent-color)[\u{1F4CD}] *Address:* #address])
        }
        if phones.len() > 0 {
          let phone_links = phones.map(p => link("tel:" + p.replace(" ", ""))[#p]).join(", ")
          r1.push([#text(fill: active-layout.accent-color)[\u{1F4DE}] *Phone:* #phone_links])
        }
        if r1.len() > 0 {
          contact-rows.push(r1.join(h(1.0em)))
        }

        if emails.len() > 0 {
          let email_links = emails.map(e => link("mailto:" + e)[#e]).join(", ")
          contact-rows.push([#text(fill: active-layout.accent-color)[\u{2709}] *Email:* #email_links])
        }

        if links.len() > 0 {
          let rendered_links = links.map(l => {
            if type(l) == dictionary {
              link(l.url)[#l.at("display", default: l.url)]
            } else {
              link(l)[#l]
            }
          }).join(", ")
          contact-rows.push([#text(fill: active-layout.accent-color)[\u{1F517}] *LinkedIn:* #rendered_links])
        }

        if contact-rows.len() > 0 {
          block(width: 100%, above: active-layout.name-to-contacts-gap * d, below: 0pt)[
            #set text(size: active-layout.contact-details-font-scale)
            #stack(
              dir: ttb,
              spacing: active-layout.contact-rows-gap,
              ..contact-rows,
            )
          ]
        }
      }
    ]
  ]

  body
}

// Section Divider Function
#let cv_section(title) = context {
  let cfg = cv-layout-state.get()
  let d = cfg.density
  block(
    width: 100%,
    stroke: (bottom: 0.8pt + cfg.accent-color),
    inset: (bottom: 0.25em),
    above: cfg.section-title-above * d,
    below: cfg.section-title-below,
  )[
    #text(size: 1.15em, weight: "bold", fill: cfg.accent-color)[#upper(title)]
  ]
}

// Summary Block
#let cv_summary(content) = context {
  let cfg = cv-layout-state.get()
  cv_section("Professional Summary")
  text(fill: cfg.text-color)[#content]
}

// Structured Entry Function Supporting Nested Hierarchies
#let cv_entry(
  title: "",
  subtitle: "",
  date: "",
  location: "",
  breakable: false,
  ..body-sink,
) = context {
  let cfg = cv-layout-state.get()
  let d = cfg.density
  let raw-body = if body-sink.pos().len() > 0 { body-sink.pos().first() } else { none }
  
  let has-body = raw-body != none and repr(raw-body) != "[]" and repr(raw-body) != "[ ]"
  let has-second-row = subtitle != "" or location != ""

  block(
    width: 100%,
    breakable: breakable,
    above: 0pt,
    below: cfg.entry-between-entries-gap * d,
  )[
    #block(
      width: 100%,
      above: 0pt,
      below: if has-body { cfg.entry-header-to-body-gap } else { 0pt },
    )[
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        row-gutter: cfg.entry-title-to-subtitle-gap,
        text(weight: "bold", size: 1.01em, fill: black)[#title],
        text(weight: "bold", fill: cfg.text-color, size: 0.95em)[#date],
        ..(
          if has-second-row {
            (
              text(style: "italic", fill: cfg.text-color, size: 0.95em)[#subtitle],
              text(style: "italic", fill: cfg.muted-color, size: 0.92em)[#location],
            )
          } else {
            ()
          }
        ),
      )
    ]
    #if has-body [
      #block(width: 100%, above: 0pt, below: 0pt, breakable: breakable)[
        #set text(fill: cfg.text-color)
        #show list: set block(above: 0pt, below: 0pt)
        #show list: it => {
          show list: set block(
            above: cfg.entry-sublist-gap-above,
            below: cfg.entry-sublist-gap-below,
          )
          it
        }
        #set list(
          marker: (
            text(fill: cfg.text-color, size: 0.75em)[\u{27A2}], // Primary Level Indicator
            text(fill: cfg.text-color, size: 0.75em)[\u{2714}], // Sub-item Checklist Indicator
          ),
          spacing: cfg.entry-list-spacing,
          body-indent: cfg.entry-list-body-indent,
        )
        #raw-body
      ]
    ]
  ]
}