// =============================================================================
// Sample Cover Letter
// Compiled with Typst (typst compile cover-letter-sample.typ)
// =============================================================================

#import "cover-letter.typ": cover_letter, cv_link, cv_email, cv_phone, mute, accent

#show: cover_letter.with(
  name: "Jordan Lee",
  address: "Seattle, WA, United States",
  phones: ("+1 (206) 555-0199",),
  emails: ("jordan.lee@example.com",),
  links: (
    (url: "https://linkedin.com/in/example-jordan-lee", display: "linkedin.com/in/jordan-lee"),
  ),
  date: "November 24, 2026",
  recipient-name: "Hiring Team – Distributed Infrastructure",
  recipient-org: "Apex Cloud Innovations",
  recipient-address: "Seattle, WA",
  subject: "Application for Principal Infrastructure Architect (Req ID: 84920)",
  salutation: "Dear Hiring Manager,",
  closing: "Sincerely,",
  paper: "a4",
  font-size: 12pt,
  layout: (
    density: 1.5,
  ),
)

I am writing to express my strong interest in the Principal Infrastructure Architect position within the Distributed Infrastructure organization at Apex Cloud Innovations. With over 10 years of experience designing resilient multi-region cloud platforms, high-throughput Go microservices, and automated Kubernetes orchestration pipelines, I am excited by the opportunity to help scale your enterprise container runtime.

Throughout my tenure at Cascade Data Networks and FinScale Technologies, I led architectural initiatives that bridged low-level systems performance with strict operational reliability. At Cascade, I architected a real-time event aggregation engine in Go capable of sustaining 500k events per second at sub-10ms p99 latency, while introducing dynamic partition balancing to eliminate network rebalance spikes across geo-replicated clusters.

Beyond core systems engineering, I bring extensive experience driving cross-team technical alignment and mentoring senior and mid-level engineers. Whether establishing unified RFC quality gates, automating zero-downtime database migrations via custom Kubernetes operators, or leading chaos engineering drills, I focus on building pragmatic, observable systems that empower product teams to ship safely.

I am currently based in Seattle and welcome the opportunity to discuss how my background in distributed systems architecture and platform reliability can support Apex Cloud Innovations' upcoming infrastructure roadmap. Thank you for your time and consideration.