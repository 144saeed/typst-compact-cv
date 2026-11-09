// =============================================================================
// Sample Curriculum Vitae
// Compiled with Typst (typst compile cv-sample.typ)
// =============================================================================

#import "template.typ": cv, cv_section, cv_summary, cv_entry, mute, accent, accentcolor, darkgraytext

#show: cv.with(
  name: "Jordan Lee",
  address: "Seattle, WA, United States",
  phones: ("+1 (206) 555-0199",),
  emails: ("jordan.lee@example.com", "jlee.dev@techdomain.org"),
  links: (
    (url: "https://linkedin.com/in/example-jordan-lee", display: "linkedin.com/in/jordan-lee"),
    (url: "https://github.com/example-jordan-lee", display: "github.com/jordan-lee"),
  ),
  paper: "a4",
  font-size: 9.5pt,
  layout: (
    density: 1.0,
    page-margin: (x: 0.75in, top: 0.65in, bottom: 0.65in),
    section-title-above: 1.4em,
    section-title-below: 0.6em,
    entry-between-entries-gap: 1.0em,
    entry-header-to-body-gap: 0.55em,
    entry-list-spacing: 0.48em,
    entry-list-body-indent: 0.4em,
    entry-sublist-gap-above: 0.25em,
    entry-sublist-gap-below: 0.35em,
  ),
)

#cv_summary[
  Principal Systems Engineer with over 10 years of experience architecting resilient distributed platforms, high-throughput microservices, and automated multi-region cloud infrastructures. Proven track record in orchestrating large-scale Kubernetes clusters, reducing end-to-end service latency, and leading cross-functional platform reliability engineering initiatives. Passionate about open-source tooling, continuous delivery pipelines, and maintaining zero-downtime operational standards.
]

#cv_section("Skills & Technical Expertise")
- *Cloud & Distributed Systems:* Kubernetes, Docker, Terraform, Amazon Web Services (AWS), Google Cloud Platform (GCP), Service Mesh (Istio), Event-Driven Architecture, Kafka.
- *Core Programming & Frameworks:* Go, Rust, Python, TypeScript, Node.js, gRPC, RESTful APIs, High-Throughput Networking.
- *Data Stores & Caching:* PostgreSQL, Redis, Elasticsearch, CockroachDB, DynamoDB, Query Optimization, Database Migration Strategies.
- *Observability & SRE:* Prometheus, Grafana, OpenTelemetry, Distributed Tracing, Chaos Engineering, SLO/SLA Definition, Incident Management.
- *Engineering Leadership:* Technical Architecture Roadmaps, Agile Mentorship (Managing 12+ Engineers), Cross-Organizational Alignment, RFC Proposals.
- *Languages:* English (_Native_), Spanish (_Professional Working Proficiency_), Japanese (_Elementary_).

#cv_section("Professional Experience")

#cv_entry(
  title: "Principal Infrastructure Architect",
  subtitle: "Apex Cloud Innovations, Seattle, WA",
  date: "Jan 2024 – Present",
)[
  - *Initiative:* Core re-architecture of the enterprise container runtime serving over 150 million daily active requests across hybrid cloud environments.
  - Implemented automated autoscaling policies based on real-time request volume metrics, decreasing compute overhead by 28%.
  - Supervised infrastructure hardening and zero-trust networking migration utilizing WireGuard and SPIFFE/SPIRE.
  - Spearheaded weekly architectural alignment sessions with technical leads, establishing unified engineering quality gates.
]

#cv_entry(
  title: "Staff Software Engineer - Core Platform",
  subtitle: "Cascade Data Networks, San Francisco, CA",
  date: "2019 – 2024",
  breakable: true,
)[
  - *Distributed Messaging & Stream Processing:*
    - Designed and implemented a high-performance event aggregation engine in Go, processing 500k events/second at sub-10ms p99 latency.
    - Extended consumer cluster capabilities with dynamic partition balancing to mitigate network rebalance spikes.
    - Integrated distributed tracing across heterogeneous microservices, boosting operational visibility and reducing root-cause triage time.
  - *Database Reliability & High Availability:*
    - Automated zero-downtime database schema migration workflows using custom Kubernetes operators.
    - Managed geo-replicated database clusters, ensuring reliable data recovery and meeting compliance objectives.
  - *Team Mentorship & Culture:* Coordinated onboarding programs and mentored 9 junior and mid-level engineers in distributed system patterns and test-driven methodologies.
]

#cv_entry(
  title: "Senior Backend Engineer",
  subtitle: "FinScale Technologies, New York, NY",
  date: "March 2023 – Jan 2024",
)[
  - Developed critical transaction ledger services handling financial transfers with strict idempotency and consistency guarantees.
  - Authored custom static analysis linters in Go to enforce uniform concurrency practices and eradicate thread-safety regressions.
  - Participated in weekly on-call operational rotations, successfully maintaining 99.99% core platform availability.
]

#cv_entry(
  title: "DevOps & Release Engineer",
  subtitle: "Beacon Media Systems, Austin, TX",
  date: "Jan 2022 – March 2023",
)[
  - Streamlined continuous deployment pipelines using ArgoCD and GitHub Actions, reducing deployment rollout duration from 45 minutes to 7 minutes.
  - Formulated disaster recovery runbooks and conducted regular game-day drills to test regional failover automation.
  - Conducted cross-team training on security scanning tooling and container image vulnerability mitigation.
]

#cv_entry(
  title: "Full-Stack Software Consultant (Contract)",
  subtitle: "Nexus Solutions Group, Remote",
  date: "July 2021 – Dec 2021",
)[
  - Designed and delivered responsive customer administrative portals using React and Node.js microservices.
  - Configured role-based access control (RBAC) and Single Sign-On (SSO) integrations supporting SAML and OIDC.
]

#cv_entry(
  title: "Site Reliability Engineer",
  subtitle: "AeroPulse Digital, Denver, CO",
  date: "Oct 2020 – June 2021",
)[
  - Built real-time monitoring dashboards and automated alerting rules in Grafana, catching latency degradation prior to customer impact.
]

#cv_entry(
  title: "Teaching Assistant (Operating Systems & Networks)",
  subtitle: "University of Washington, Seattle, WA",
  date: "2018 – 2020",
)[
  - Led weekly lab discussions on memory virtualization, thread synchronization, and network socket programming.
]

#cv_section("Education")

#cv_entry(
  title: "M.S. in Computer Science (Distributed Systems)",
  subtitle: "University of Washington, Seattle, WA",
  date: "2020",
)[
  - _Thesis: "Consensus Optimization and Partition Resilience in Edge-Deployed Data Stores"._
]

#cv_entry(
  title: "B.S. in Computer Engineering (Magna Cum Laude)",
  subtitle: "Purdue University, West Lafayette, IN",
  date: "2018",
)

#cv_section("Selected Technical Publications")
- "Fault-Tolerant State Replication for Edge Microservices," _IEEE Transactions on Cloud Computing_, 2023, DOI: #link("https://doi.org/10.1109/TCC.example")[10.1109/TCC.example].
- "Evaluating Tail Latency Mitigations in Virtualized Service Meshes," _ACM SIGOPS Operating Systems Review_, 2021, DOI: #link("https://doi.org/10.1145/example")[10.1145/example].