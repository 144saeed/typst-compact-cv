// =============================================================================
// Shared Core Utilities, Palette & Styling for Typst Application Suite
// =============================================================================

// Default Color Palette
#let accentcolor = rgb(24, 76, 120)       // Deep Professional Navy
#let darkgraytext = rgb(64, 64, 64)       // Primary Body Text
#let mutedgray = rgb(115, 115, 115)       // Secondary / Location Text

#let base-theme-colors = (
  accent-color: accentcolor,
  text-color: darkgraytext,
  muted-color: mutedgray,
)

// Shared Layout & Theme State
#let cv-layout-state = state("cv-layout", base-theme-colors)

// Inline Utility Functions
#let mute(it) = context text(fill: cv-layout-state.get().at("muted-color", default: mutedgray))[#it]
#let accent(it) = context text(fill: cv-layout-state.get().at("accent-color", default: accentcolor))[#it]

#let cv_link(url, display: none) = {
  let label = if display != none and display != "" { display } else { url }
  link(url)[#label]
}

#let cv_email(address) = link("mailto:" + address.trim())[#address]

#let cv_phone(number) = link("tel:" + number.replace(" ", ""))[#number]

// Merge Default Layout, User Layout Dictionary, and Top-Level Color Overrides
#let resolve-layout(
  defaults,
  layout: (:),
  accent-color: none,
  text-color: none,
  muted-color: none,
) = {
  let user-colors = (:)
  if accent-color != none { user-colors.insert("accent-color", accent-color) }
  if text-color != none { user-colors.insert("text-color", text-color) }
  if muted-color != none { user-colors.insert("muted-color", muted-color) }

  defaults + if type(layout) == dictionary { layout } else { (:) } + user-colors
}

// Apply Shared Typography, Hyperlink, and Emphasis Rules
#let apply-base-styles(
  active-layout,
  font-size: 9.5pt,
  line-leading: 0.35em,
  body,
) = {
  set text(
    font: ("Roboto", "Liberation Sans", "DejaVu Sans"),
    size: font-size,
    fill: black,
    lang: "en",
  )

  set par(justify: true, leading: line-leading)

  show link: it => {
    set text(fill: active-layout.accent-color)
    underline(stroke: 0.5pt + active-layout.accent-color, offset: 1.5pt, it)
  }

  show strong: it => text(fill: black, weight: "bold", it)

  body
}