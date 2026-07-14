# 📅 60-Day Detailed Curriculum: Agentic AI & Enterprise DevOps

## 📌 Phase 1: Production Python, PowerShell, Git & Coolify DevOps (Days 1–7)
*Focus: Level up scripting languages to production standards and master modern containerized self-hosting.*

---

### Day 1: Production-Ready Python
* **Objective**: Move beyond scripts to production Python code using asynchronous programming, type safety, and package management.
* **Topics**: Asyncio, event loops, type hints, Pydantic v2 validation, Poetry package management.
* **Practice Lab**: Build an asynchronous script that fetches data from multiple public REST APIs concurrently, parses responses into Pydantic models, handles rate limits (backoff), and logs errors using the `logging` module.

### Day 2: Production PowerShell & Git Workflows
* **Objective**: Write enterprise-grade, secure, and debuggable PowerShell scripts.
* **Topics**: Advanced functions, error handling (`Try/Catch`), signing scripts, Git branching patterns, conventional commits, and pre-commit hooks.
* **Practice Lab**: Develop an advanced PowerShell script with parameters, verbose logging, and error-handling, to audit local system settings. Add a pre-commit hook to lint the script using PSScriptAnalyzer.

### Day 3: Docker & Containerization Deep Dive
* **Objective**: Package applications securely and efficiently using Docker.
* **Topics**: Multi-stage builds, rootless containers, volume mount strategies, docker-compose, and minimizing image sizes.
* **Practice Lab**: Containerize a Python FastAPI application. Use multi-stage builds to exclude build tools from the final image and run as a non-root user.

### Day 4: Self-Hosting with Coolify (DevOps Platform)
* **Objective**: Implement a self-hosted alternative to Heroku/Railway using Coolify.
* **Topics**: Self-hosting, Coolify installation, reverse proxies, SSL configuration (Let's Encrypt), and managing environment variables.
* **Practice Lab**: Set up Coolify on a local virtual machine or cloud instance. Deploy your containerized FastAPI app from Day 3 through Coolify with automatic SSL termination.

### Day 5: Docker Networking & Reverse Proxies
* **Objective**: Configure network isolation, domains, and reverse proxies.
* **Topics**: Traefik/Nginx, Docker networks, SSL wildcard certificates, and local DNS mapping.
* **Practice Lab**: Deploy Immich (self-hosted photo library) using docker-compose. Configure a reverse proxy to expose it locally over HTTPS with custom routing rules.

### Day 6: Self-Hosting Business Applications (NocoDB & Immich)
* **Objective**: Self-host database-spreadsheets and object storage systems.
* **Topics**: NocoDB APIs, Postgres backing, Immich machine learning container tuning.
* **Practice Lab**: Deploy NocoDB and connect it to a local PostgreSQL instance. Write a Python script to populate NocoDB with test records using its REST API, then verify database structure.

### Day 7: Phase 1 Review & Architecture Diagrams
* **Objective**: Solidify DevOps, containerization, and scripting.
* **Topics**: Drawing architectural topologies using Excalidraw.
* **Practice Lab**: Diagram your self-hosted stack (Coolify, FastAPI, NocoDB, Immich, Traefik). Document container interactions, network boundaries, and volume mapping.

---

## 📌 Phase 2: Terraform & Production AWS Architecture (Days 8–14)
*Focus: Master Infrastructure as Code (IaC) and production-grade AWS multi-account governance.*

---

### Day 8: Terraform Fundamentals & State Management
* **Objective**: Provision resources declaratively using Terraform.
* **Topics**: Providers, resources, variables, outputs, remote state backend (S3 & DynamoDB lock), and state migration.
* **Practice Lab**: Create a Terraform configuration that provisions an AWS S3 bucket and a DynamoDB table for backend state management, then migrate your state to it.

### Day 9: Modular Terraform
* **Objective**: Write reusable, dry Terraform modules.
* **Topics**: Modules, workspace environments (dev/prod), ternary operators, dynamic blocks.
* **Practice Lab**: Write a Terraform module to provision a custom VPC with public/private subnets, an internet gateway, and route tables. Deploy both a Dev and Prod instance.

### Day 10: Production AWS Organizations & SCPs
* **Objective**: Design a multi-account AWS architecture.
* **Topics**: AWS Organizations, Service Control Policies (SCPs), consolidated billing, and account isolation.
* **Practice Lab**: Write SCPs using Terraform that prevent member accounts from disabling CloudTrail, deleting guardrails, or launching unauthorized instance types.

### Day 11: AWS IAM Identity Center & Access Control
* **Objective**: Implement centralized identity and single sign-on (SSO) in AWS.
* **Topics**: IAM Identity Center, Permission Sets, RBAC, session duration, and multi-factor authentication (MFA) policies.
* **Practice Lab**: Configure AWS IAM Identity Center using Terraform. Create groups (e.g., SecurityOps, Developers) and attach appropriate permission sets to them.

### Day 12: AWS CloudTrail, GuardDuty & Security Auditing
* **Objective**: Implement continuous security auditing and threat detection.
* **Topics**: CloudTrail log delivery, GuardDuty findings, S3 bucket security, and KMS encryption.
* **Practice Lab**: Enable AWS GuardDuty and organization-wide CloudTrail using Terraform. Configure notifications for high-severity GuardDuty findings using SNS.

### Day 13: Hybrid Active Directory (AD DS) & Entra Connect
* **Objective**: Bridge on-premises Active Directory with cloud Entra ID.
* **Topics**: AD DS domain setup, ADFS, Entra Connect synchronization, password hash sync vs pass-through authentication.
* **Practice Lab**: Conceptualize and diagram a hybrid directory architecture. Write a PowerShell script that checks active user objects in AD DS and compares properties with expected Entra ID schema.

### Day 14: Phase 2 Review: Terraform & AWS Auditing
* **Objective**: Verify security compliance on AWS.
* **Topics**: AWS Secure Score, Zero Trust auditing, and Terraform drift analysis.
* **Practice Lab**: Run a security scanning tool (like tfsec or Checkov) against your Terraform code. Remediate all high-severity findings and document the zero-trust improvements.

---

## 📌 Phase 3: Production Kubernetes, Observability & Identity Governance (Days 15–21)
*Focus: Master EKS orchestration, enterprise security tooling, and advanced identity governance.*

---

### Day 15: Kubernetes Core Concepts & Manifests
* **Objective**: Master pods, deployments, services, and config maps.
* **Topics**: Pod lifecycle, ReplicaSets, ClusterIP vs NodePort vs LoadBalancer services, ingress rules.
* **Practice Lab**: Write Kubernetes manifests to deploy a multi-replica Python backend. Set up resource limits, liveness/readiness probes, and exposed services.

### Day 16: Amazon EKS (Elastic Kubernetes Service)
* **Objective**: Provision a managed production Kubernetes cluster on AWS.
* **Topics**: EKS control plane, managed node groups, IAM Roles for Service Accounts (IRSA), and VPC CNI.
* **Practice Lab**: Write Terraform code to spin up a production-ready EKS cluster with 3 nodes, isolated inside private subnets.

### Day 17: Production Kubernetes Security (1Password, CrowdStrike & Cloudflare)
* **Objective**: Secure workloads, secrets, and entry points.
* **Topics**: 1Password Operator (external secrets), CrowdStrike Falcon agent injection, and Cloudflare Tunnels for secure ingress.
* **Practice Lab**: Install the ExternalSecrets Operator on your EKS cluster. Sync a mock database password from a simulated secret vault without committing it to Git.

### Day 18: Kubernetes Monitoring & Observability (Datadog & GitLab CI)
* **Objective**: Configure metrics tracking and automated deployments.
* **Topics**: Datadog Agent DaemonSet, GitLab CI runner, Helm charts, and log forwarding.
* **Practice Lab**: Deploy Datadog agents to EKS using Helm. Create a dashboard displaying cluster CPU, memory pressure, and API server latency.

### Day 19: Identity Governance (PIM & Conditional Access)
* **Objective**: Implement Just-In-Time (JIT) access and Adaptive MFA.
* **Topics**: Microsoft Entra Privileged Identity Management (PIM), Conditional Access policies, secure scores.
* **Practice Lab**: Configure Entra ID Conditional Access policies via Microsoft Graph API (using Python) to enforce MFA if access is requested from outside the corporate IP range.

### Day 20: Security Compliance (SOC 2, ISO 27001, NIST & Zero Trust)
* **Objective**: Map infrastructure configuration to regulatory compliance matrices.
* **Topics**: Zero Trust network access (ZTNA), SOC 2 Trust Services Criteria, NIST SP 800-53 controls.
* **Practice Lab**: Perform a mock audit of your AWS and Kubernetes infrastructure. Compile a markdown compliance registry mapping controls (e.g., encryption at rest) to specific configuration parameters.

### Day 21: Phase 3 Review: SIEM Integration (Sentinel/Splunk)
* **Objective**: Monitor cloud infrastructure security events.
* **Topics**: Splunk/Sentinel logs, ingestion pipelines, query syntax, incident response playbooks.
* **Practice Lab**: Write Kusto Query Language (KQL) queries for Microsoft Sentinel to detect unauthorized administrative role additions in Entra ID.

---

## 📌 Phase 4: Modern SaaS Stack & API Orchestration (Days 22–30)
*Focus: Master Supabase, n8n, Cal.com, Documenso, and API-first architectures.*

---

### Day 22: Supabase Architecture & Database Essentials
* **Objective**: Build backend storage, realtime DBs, and API layers using Supabase.
* **Topics**: PostgreSQL schemas, migrations, storage buckets, and realtime subscriptions.
* **Practice Lab**: Set up a local Supabase CLI environment. Define database tables for a booking application, including relationship keys.

### Day 23: Row Level Security (RLS) & JWT Authentication
* **Objective**: Lock down databases directly at the engine layer using JWT-based RLS.
* **Topics**: JWT tokens, claims, policy creation (`CREATE POLICY`), and schema segregation.
* **Practice Lab**: Write RLS policies for your booking database to ensure users can only view, edit, or delete bookings associated with their own `auth.uid()`.

### Day 24: Supabase Edge Functions
* **Objective**: Implement serverless Javascript/Typescript APIs on the edge.
* **Topics**: Deno runtime, environment variables, fetching third-party APIs, and triggering edge functions.
* **Practice Lab**: Write a Deno Edge Function that receives an ID, queries a table, performs a payload transformation, and returns signed JSON data.

### Day 25: PostHog Product Analytics & Event Tracking
* **Objective**: Implement user tracking, behavioral analytics, and session replays.
* **Topics**: PostHog JS SDK, custom events, ingestion pipelines, and user identification.
* **Practice Lab**: Integrate PostHog into a frontend application. Write custom event trackers for a checkout page and set up a session recording capture rule.

### Day 26: PostHog Feature Flags & Experimentation
* **Objective**: Implement canary releases and A/B testing frameworks.
* **Topics**: Feature flags evaluation, multivariate tests, and cohort definitions.
* **Practice Lab**: Write Python code using the PostHog SDK to dynamically toggle application behaviors depending on whether a user has a specific feature flag enabled.

### Day 27: n8n Basics & API Orchestration
* **Objective**: Build reliable API-driven workflows.
* **Topics**: n8n nodes, JSON expressions, webhooks, error-handling routes, and credentials.
* **Practice Lab**: Create an n8n workflow triggered by an incoming HTTP POST webhook. The workflow should parse the JSON payload, query a Postgres database, and send a Slack alert if a threshold is exceeded.

### Day 28: Cal.com API & OAuth
* **Objective**: Integrate advanced scheduling functionality.
* **Topics**: Cal.com REST API, OAuth 2.0 flow, webhooks, and calendar sync.
* **Practice Lab**: Set up an OAuth 2.0 connection to Cal.com. Build an integration that listens to a `booking.created` webhook and records the event in your Supabase backend.

### Day 29: Documenso & Digital Signatures (PKI)
* **Objective**: Implement legally binding digital signing workflows.
* **Topics**: Digital signatures, PKI, PDF generation, and document audit trails.
* **Practice Lab**: Use Documenso's API to upload a PDF, place a signing field, send an invite to a test user, and verify the cryptographic signature hash after completion.

### Day 30: Phase 4 Review: Custom n8n Nodes
* **Objective**: Extend n8n with custom integrations.
* **Topics**: n8n custom node layout, credential handling, and deployment.
* **Practice Lab**: Write a custom n8n community node or a composite HTTP Request node to interact with the Drata compliance API, retrieving daily security checklist status.

---

## 📌 Phase 5: Stateful Agentic AI & Memory Architectures (Days 31–45)
*Focus: Master LangGraph stateful orchestrations, advanced memory networks, and semantic retrieval.*

---

### Day 31: LangChain Foundation & Tool Invocation
* **Objective**: Bind LLMs to external APIs using tool calling.
* **Topics**: ChatModels, prompt templates, structured output, and tool-binding bindings.
* **Practice Lab**: Write a Python script using LangChain that binds a mathematical calculator tool to an LLM, ensuring it calls the tool when asked math questions.

### Day 32: LangGraph Core: Graphs & State Management
* **Objective**: Build stateful agent applications using graphs.
* **Topics**: State, nodes, edges, conditional edges, and compilers.
* **Practice Lab**: Create a LangGraph application representing a support agent. Define a state dictionary, create a routing logic node, and compile the graph.

### Day 33: Persistence & Checkpointers in LangGraph
* **Objective**: Enable conversational history, checkpoint saving, and time travel.
* **Topics**: Memory checkpointers, SQLite saver, thread configuration, and state restoring.
* **Practice Lab**: Implement a checkpointer in your support agent graph. Validate that you can interrupt execution, resume from a specific thread ID, and inspect past states.

### Day 34: Human-in-the-Loop (HITL) in LangGraph
* **Objective**: Implement approval gates for high-risk actions.
* **Topics**: Breakpoints, feedback loops, manual state edits, and node suspension.
* **Practice Lab**: Update your graph to pause execution and ask for human approval before calling a tool that performs a mock database write or external API update.

### Day 35: Chat Threading & Multi-Actor Routing
* **Objective**: Manage concurrent multi-user channels.
* **Topics**: Thread partitioning, parallel execution paths, and agent delegation.
* **Practice Lab**: Build a supervisor agent graph that routes tasks to specialist agents (e.g., Writer, Coder) based on user query analysis.

### Day 36: Agentic Memory: Short-Term vs Long-Term
* **Objective**: Design multi-layered agent memory profiles.
* **Topics**: Conversational Buffer Memory, Sliding Window, and Vector Store Memory.
* **Practice Lab**: Write an agent that maintains a short-term conversational window but fetches user preferences from a PostgreSQL database (long-term store).

### Day 37: Advanced Memory: Abstractive & Progressive Summary Memory
* **Objective**: Maintain state over long conversations without exceeding context limits.
* **Topics**: Summary Buffer, Token budgeting, and abstractive summarizing nodes.
* **Practice Lab**: Implement a background summarizer node in LangGraph. As the conversational token count approaches a threshold, condense history into an abstractive summary and update the state.

### Day 38: Memory Routing & Entity Memory
* **Objective**: Extract and structure metadata about real-world entities mentioned in chat.
* **Topics**: Entity extraction, JSON graph memory, and dynamic memory retrieval routing.
* **Practice Lab**: Build a memory system that extracts key facts about a user's company (e.g., team size, stack) during a conversation, saving it structured to Supabase.

### Day 39: Episodic & Semantic Memory Architectures
* **Objective**: Emulate human memory architectures in software.
* **Topics**: Episodic memories (raw interaction logs), Semantic memory (factual rules), and Procedural memory (tool instructions).
* **Practice Lab**: Build a memory store where the agent stores successful trajectories (episodic) and uses them as few-shot examples for future tasks.

### Day 40: Mathematical Memory Decay (Ebbinghaus Forgetting Curves)
* **Objective**: Implement memory relevance decay scoring over time.
* **Topics**: Half-life decay formulas, time-delta scoring, and vector retrieval sorting.
* **Practice Lab**: Write a custom retrieval algorithm that scores memories based on: `Score = Relevance * e^(-lambda * t)`. Filter out old, irrelevant memories.

### Day 41: Vector Databases: Dense Vector Search vs BM25 Hybrid Search
* **Objective**: Combine keyword matching with semantic matching.
* **Topics**: ChromaDB, BM25 algorithm, dense embeddings, and cross-encoders.
* **Practice Lab**: Set up a ChromaDB vector store. Index a corpus of text. Write a search pipeline that runs both a BM25 keyword search and a vector similarity search.

### Day 42: Reciprocal Rank Fusion (RRF) & Re-ranking
* **Objective**: Merge search results from multiple indexes cleanly.
* **Topics**: RRF score calculation, Cohere/HuggingFace re-rankers, and latency optimizations.
* **Practice Lab**: Implement the RRF algorithm in Python to combine your BM25 and dense search outputs, producing a final unified ranked document set.

### Day 43: Model Context Protocol (MCP) Server Integration
* **Objective**: Connect agents to standardized, external MCP tools and resources.
* **Topics**: MCP spec, server registration, client transport, and custom resource schemas.
* **Practice Lab**: Build a custom MCP server in Python that exposes your local system filesystem or database to an AI agent, implementing secure read/write controls.

### Day 44: CrewAI & AutoGen (Multi-Agent Alternatives)
* **Objective**: Compare alternative frameworks for multi-agent workflows.
* **Topics**: Roles, goals, backstories, agent communication, and execution loops.
* **Practice Lab**: Implement a marketing agent crew using CrewAI. Compare its ease of state management with your LangGraph implementations.

### Day 45: Phase 5 Review: Full-Graph Flowcharting
* **Objective**: Design complex state machines visually.
* **Topics**: State machine diagramming, cycle handling, and deadlock prevention.
* **Practice Lab**: Map out your agent's state transitions, tool interfaces, and memory architecture in Excalidraw, aligning with the BPGpt project structure.

---

## 📌 Phase 6: AI Guardrails, Security, Observability & LLM Evaluation (Days 46–54)
*Focus: Secure agents against malicious prompts, implement telemetry, and run automated evaluations.*

---

### Day 46: NVIDIA NeMo Guardrails
* **Objective**: Implement input/output protection for LLM queries.
* **Topics**: NeMo configuration, Colang expression language, and routing rules.
* **Practice Lab**: Write a NeMo Guardrails policy that intercepts user input and blocks any query containing prompt injection patterns.

### Day 47: Colang Deep Dive & Action Mappings
* **Objective**: Design custom interaction logic using Colang.
* **Topics**: Colang syntax, custom Python actions, and system flows.
* **Practice Lab**: Build a Colang script that enforces the agent to verify user access levels via a custom Python script before answering billing queries.

### Day 48: AWS Bedrock Guardrails & Llama Firewall
* **Objective**: Leverage cloud-managed security firewalls.
* **Topics**: Bedrock Guardrails configuration, Meta Llama Firewall parameters, and PII masking.
* **Practice Lab**: Set up a Bedrock Guardrails policy (or configure a local Meta Llama Guard pipeline) to mask PII data (emails, credit cards) before it reaches the model.

### Day 49: LLM Evaluation: Ragas Framework
* **Objective**: Run objective, automated benchmarks on RAG pipelines.
* **Topics**: Ragas metrics, test set generator, and golden datasets.
* **Practice Lab**: Set up Ragas. Evaluate a test set of 20 Q&A pairs using your hybrid search pipeline, calculating metrics for context retrieval.

### Day 50: Evaluation Metrics Deep Dive
* **Objective**: Master the math and prompt logic behind LLM evaluation metrics.
* **Topics**: Faithfulness (groundedness), Answer Relevancy, Context Precision, and Context Recall.
* **Practice Lab**: Write custom LLM-as-a-Judge prompts in Python to evaluate Faithfulness, comparing the output against the Ragas scoring baseline.

### Day 51: Agent Telemetry & Tracing (Langfuse & LangSmith)
* **Objective**: Track cost, latency, and trajectory of nested agent steps.
* **Topics**: Langfuse tracing SDK, LangSmith decorators, trace IDs, and cost calculation.
* **Practice Lab**: Integrate Langfuse into your multi-actor LangGraph application. Run a series of queries and inspect the step-by-step latency waterfall.

### Day 52: Observability with Pydantic Logfire
* **Objective**: Implement clean, structured logging optimized for Python.
* **Topics**: Logfire SDK, database spans, HTTP instrumentation, and custom attributes.
* **Practice Lab**: Instrument your FastAPI server with Pydantic Logfire. Track database query times and API request latency dashboards.

### Day 53: Load Testing Agent Endpoints (Locust)
* **Objective**: Measure concurrency limits and API scaling thresholds.
* **Topics**: Locust scripts, concurrent request simulations, and system bottlenecks.
* **Practice Lab**: Write a Locust load testing script targeting your FastAPI endpoint. Run the test with 50 concurrent users and observe latency degradation.

### Day 54: Phase 6 Review: Security & Compliance Runbook
* **Objective**: Document security response strategies.
* **Topics**: Incident response, red-teaming LLMs, and compliance alignment.
* **Practice Lab**: Create an incident response runbook detailing how to mitigate a zero-day prompt injection vulnerability discovered in production.

---

## 📌 Phase 7: Loop Engineering & Capstone Project (Days 55–60)
*Focus: Build and deploy the "BPGpt" Enterprise Identity & Security Agent.*

---

### Day 55: Loop Engineering: Build-Measure-Learn Cycles
* **Objective**: Build self-correcting agent workflows.
* **Topics**: Loop engineering, metric trackers, stop conditions, and iterative code loops.
* **Practice Lab**: Build an agent that runs in an iterative loop: writes code, runs a compiler tool, parses the error output, and refactors itself until the compilation succeeds (stop condition).

### Day 56: BPGpt Architecture & Design
* **Objective**: Architect the capstone Enterprise Identity Audit Agent.
* **Topics**: Architecture diagrams, database schemas, and microservices design.
* **Practice Lab**: Write the architectural blueprint for BPGpt. It must use:
  * **Ingestion**: n8n to sync Entra ID logs.
  * **Database**: Supabase (Postgres, RLS) to store configuration and security alerts.
  * **Agent**: LangGraph state machine mapping security remediation steps.
  * **Guardrails**: NVIDIA NeMo Guardrails shielding execution.

### Day 57: BPGpt Development - Ingestion & DB Layer
* **Objective**: Build the backend foundation for BPGpt.
* **Topics**: Supabase database setup, Edge functions, and n8n webhooks.
* **Practice Lab**: Code the schema migrations in Supabase, configure Row Level Security, and set up an n8n workflow that triggers on Entra ID role assignment alerts.

### Day 58: BPGpt Development - Agent Engine & Guardrails
* **Objective**: Code the stateful routing logic and safety mechanisms.
* **Topics**: LangGraph orchestration, tool definitions, and NeMo guardrails.
* **Practice Lab**: Code the LangGraph state machine. Build tools that trigger conditional access remediation commands (via Microsoft Graph) and secure the agent with prompt injection guardrails.

### Day 59: BPGpt Deployment & CI/CD
* **Objective**: Deploy BPGpt to production infrastructure.
* **Topics**: GitLab/GitHub CI/CD pipelines, Docker container registry, and Amazon EKS node deployment.
* **Practice Lab**: Write a CI/CD pipeline that builds the BPGpt image, runs automated Ragas tests, and deploys it to your EKS cluster with Datadog monitoring enabled.

### Day 60: BPGpt Verification, Load Test & Walkthrough
* **Objective**: Perform full verification and document results.
* **Topics**: Walkthrough document, demo recording, and final security audit.
* **Practice Lab**: Run a production load test on BPGpt, verify that all guardrails trigger on hostile prompts, verify that RLS holds on databases, and write the final walkthrough report.
