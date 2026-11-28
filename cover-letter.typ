// =============================================================================
// Modular & Clean Cover Letter Template
// Designed for Typst 0.11+
// Features: Unified Theme Palette, Dynamic Density Scaling, Single-Page Control
// =============================================================================

#import "common.typ": *

// Default Layout & Typographic Configuration for Cover Letter
#let default-cl-layout = base-theme-colors + (
  density: 1.0,
  page-margin: (x: 0.85in, top: 0.75in, bottom: 0.75in),
  header-name-size: 18.5pt,
  header-contact-size: 8.8pt,
  name-to-contacts-gap: 4pt,
  contact-rows-gap: 3.5pt,
  header-rule-above: 6pt,
  header-rule-below: 1.5em,
  date-to-recipient-gap: 1.1em,
  recipient-line-leading: 0.32em,
  recipient-to-subject-gap: 1.1em,
  subject-to-salutation-gap: 1.1em,
  salutation-to-body-gap: 0.85em,
  body-line-leading: 0.42em,
  paragraph-spacing: 0.85em,
  body-to-closing-gap: 1.2em,
  closing-to-signature-gap: 0.9em,
)

// Root Cover Letter Document Function
#let cover_letter(
  name: "",
  address: "",
  phones: (),
  emails: (),
  links: (),
  date: "",
  recipient-name: "",
  recipient-org: "",
  recipient-address: "",
  subject: "",
  salutation: "Dear Hiring Manager,",
  closing: "Sincerely,",
  signature-name: none,
  paper: "a4",
  font-size: 10pt,
  line-leading: none,
  accent-color: none,
  text-color: none,
  muted-color: none,
  layout: (:),
  body,
) = {
  let active-layout = resolve-layout(
    default-cl-layout,
    layout: layout,
    accent-color: accent-color,
    text-color: text-color,
    muted-color: muted-color,
  )
  cv-layout-state.update(active-layout)
  let d = active-layout.density
  let effective-leading = (if line-leading != none { line-leading } else { active-layout.body-line-leading }) * d

  set document(title: name + " - Cover Letter", author: name)

  set page(
    paper: paper,
    margin: active-layout.page-margin,
  )

  show: apply-base-styles.with(
    active-layout,
    font-size: font-size,
    line-leading: effective-leading,
  )

  // Left-Aligned Minimal Header (Fixed pt sizes independent of body font-size)
  block(width: 100%, above: 0pt, below: active-layout.header-rule-below * d)[
    #set par(justify: false, leading: active-layout.contact-rows-gap)
    #text(size: active-layout.header-name-size, weight: "bold", fill: active-layout.accent-color)[#name]
    #{
      let sep = [#text(fill: active-layout.muted-color)[  |  ]]
      let contact-rows = ()

      // Row 1: Address & Phones
      let r1 = ()
      if address != "" {
        r1.push([#text(fill: active-layout.muted-color)[#address]])
      }
      for p in phones {
        r1.push(cv_phone(p))
      }
      if r1.len() > 0 {
        contact-rows.push(r1.join(sep))
      }

      // Row 2: Emails & Links
      let r2 = ()
      for e in emails {
        r2.push(cv_email(e))
      }
      for l in links {
        if type(l) == dictionary {
          r2.push(cv_link(l.url, display: l.at("display", default: none)))
        } else {
          r2.push(cv_link(l))
        }
      }
      if r2.len() > 0 {
        contact-rows.push(r2.join(sep))
      }

      if contact-rows.len() > 0 {
        v(active-layout.name-to-contacts-gap, weak: true)
        text(size: active-layout.header-contact-size)[
          #stack(
            dir: ttb,
            spacing: active-layout.contact-rows-gap,
            ..contact-rows,
          )
        ]
      }
    }
    #v(active-layout.header-rule-above, weak: true)
    #line(length: 100%, stroke: 0.8pt + active-layout.accent-color)
  ]

  // Date
  if date != "" {
    block(width: 100%, above: 0pt, below: active-layout.date-to-recipient-gap * d)[
      #text(fill: active-layout.muted-color, size: 0.95em)[#date]
    ]
  }

  // Recipient Block
  {
    let recipient-lines = ()
    if recipient-name != "" {
      recipient-lines.push([#text(weight: "bold", fill: black)[#recipient-name]])
    }
    if recipient-org != "" {
      recipient-lines.push([#text(fill: active-layout.text-color)[#recipient-org]])
    }
    if recipient-address != "" {
      recipient-lines.push([#text(fill: active-layout.text-color)[#recipient-address]])
    }

    if recipient-lines.len() > 0 {
      block(width: 100%, above: 0pt, below: active-layout.recipient-to-subject-gap * d)[
        #set par(justify: false, leading: active-layout.recipient-line-leading)
        #recipient-lines.join([\ ])
      ]
    }
  }

  // Subject Line
  if subject != "" {
    block(width: 100%, above: 0pt, below: active-layout.subject-to-salutation-gap * d)[
      #set par(justify: false)
      #text(weight: "bold", fill: black)[Subject: #subject]
    ]
  }

  // Salutation
  if salutation != "" {
    block(width: 100%, above: 0pt, below: active-layout.salutation-to-body-gap * d)[
      #set par(justify: false)
      #text(fill: active-layout.text-color)[#salutation]
    ]
  }

  // Letter Body
  {
    set text(fill: active-layout.text-color)
    set par(
      leading: effective-leading,
      spacing: active-layout.paragraph-spacing * d,
    )
    body
  }

  // Closing & Signature
  {
    let sign-off = if signature-name != none and signature-name != "" { signature-name } else { name }
    block(width: 100%, above: active-layout.body-to-closing-gap * d, below: 0pt, breakable: false)[
      #set par(justify: false)
      #text(fill: active-layout.text-color)[#closing]
      #v(active-layout.closing-to-signature-gap * d, weak: true)
      #text(weight: "bold", fill: black)[#sign-off]
    ]
  }
}