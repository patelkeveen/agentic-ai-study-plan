# 📅 60-Day Detailed Curriculum: Agentic AI & Enterprise DevOps

---

## 📌 Phase 1: Job-Ready Foundation (Days 1–10)
*Goal: Acquire essential programming, DevOps, database, automation, and basic AI orchestration skills to become instantly hirable for engineering roles.*

---

### Day 1: Production-Ready Python
* **Objective**: Write enterprise-grade, asynchronous, type-safe Python code.
* **Concepts**: Asyncio event loops, type-hinting, Pydantic v2 validation, Poetry package management.
* **Practice Lab**: Build an async Python script fetching data concurrently from three public REST APIs. Parse results with Pydantic, implement rate-limiting backoffs, and write structured logs.

### Day 2: Enterprise PowerShell & Git Workflows
* **Objective**: Build secure, modular PowerShell scripts integrated with Git.
* **Concepts**: Advanced functions, `Try/Catch` handling, script signing, PSScriptAnalyzer, conventional commits, pre-commit hooks.
* **Practice Lab**: Build a parameterized PowerShell script to audit local configurations. Hook it to Git pre-commits to automatically run lints and formatters.

### Day 3: Docker & Containerization Deep Dive
* **Objective**: Package application logic securely in isolated containers.
* **Concepts**: Multi-stage builds, non-root users, volume mounts, docker-compose, image size optimization.
* **Practice Lab**: Containerize your Day 1 Python FastAPI service. Exclude dev-dependencies from the production image and verify rootless execution.

### Day 4: Self-Hosting with Coolify & Reverse Proxies
* **Objective**: Implement a self-hosted cloud platform using Coolify.
* **Concepts**: Coolify, Traefik/Nginx, Docker network bridging, Let's Encrypt SSL certificates.
* **Practice Lab**: Set up Coolify on a VM or VPS. Deploy your FastAPI application via Coolify with automatic SSL termination.

### Day 5: Supabase Core: DB, Auth & Edge Functions
* **Objective**: Build cloud backend APIs, storage, and database triggers.
* **Concepts**: PostgreSQL tables, migration scripts, Supabase Edge Functions (Deno/TypeScript), REST APIs.
* **Practice Lab**: Set up Supabase CLI. Define database schemas for a booking platform, and deploy an Edge Function that transforms and inserts incoming web requests.

### Day 6: Supabase Row Level Security (RLS) & JWT Auth
* **Objective**: Secure databases at the engine level using token claims.
* **Concepts**: JWT payloads, claims, custom RLS policies (`CREATE POLICY`), schema locking.
* **Practice Lab**: Configure RLS policies on your booking database to ensure users can only view, edit, or delete items where `user_id == auth.uid()`.

### Day 7: n8n Workflow Automation Architecture
* **Objective**: Connect disparate systems using n8n workflows (replacing Zapier/Make/custom scripts).
* **Concepts**: Webhook triggers, OAuth 2.0 credentials, HTTP request nodes, JSON manipulation.
* **Practice Lab**: Create an n8n workflow triggered by an external POST webhook. Parse the JSON, query your Supabase database, and push custom Slack alerts.

### Day 8: Modern SaaS APIs (Cal.com, Documenso, NocoDB)
* **Objective**: Integrate industry-standard business APIs.
* **Concepts**: Cal.com scheduling payloads, Documenso digital signature PKI, NocoDB relational-to-API engine.
* **Practice Lab**: Set up an integration where a Cal.com booking webhook triggers Documenso API to send a document for digital signing, logging progress inside NocoDB.

### Day 9: LangChain Foundation & LLM Tool Calling
* **Objective**: Interface with Large Language Models and expose tools to them.
* **Concepts**: ChatModels, prompt templates, structured output, tool binding, system instructions.
* **Practice Lab**: Create a Python script using LangChain that binds a calculations tool to an LLM, forcing the LLM to call the tool instead of hallucinating math.

### Day 10: Phase 1 Capstone: Auto-Remediation Identity Script
* **Objective**: Consolidate Phase 1 skills into a functional automation tool.
* **Concepts**: Integration of Python, Supabase, n8n, and LLM APIs.
* **Practice Lab**: Build an automation that listens to simulated identity log additions, writes the telemetry to Supabase, triggers an n8n flow, and uses LangChain to generate an admin remediation script.

---

## 📌 Phase 2: Leveling Up & Essential Projects (Days 11–30)
*Goal: Expand into Infrastructure as Code, multi-account Cloud security, and stateful, persistent AI graph agents.*

---

### Day 11: Terraform Infrastructure Provisioning
* **Objective**: Deploy resources declaratively using Terraform.
* **Concepts**: Providers, resources, variables, output bindings, remote state backend (S3/DynamoDB locks).
* **Practice Lab**: Write a Terraform script to create an AWS S3 bucket and DynamoDB table, then migrate your state backend to it.

### Day 12: Modular Terraform Environments
* **Objective**: Maintain dry, environment-isolated configurations.
* **Concepts**: Terraform modules, workspace isolation, ternary logic, dynamic blocks.
* **Practice Lab**: Create a custom VPC module. Deploy separate, network-isolated "Development" and "Production" workspaces.

### Day 13: AWS Organizations & Service Control Policies (SCPs)
* **Objective**: Build secure enterprise multi-account structures.
* **Concepts**: AWS Organizations, consolidated billing, Service Control Policies, account boundaries.
* **Practice Lab**: Write SCPs in Terraform that block member accounts from deleting CloudTrail trails or altering core VPC layouts.

### Day 14: AWS IAM Identity Center & Access Policies
* **Objective**: Configure centralized SSO and fine-grained RBAC.
* **Concepts**: IAM Identity Center, permission sets, group mapping, session durations.
* **Practice Lab**: Provision AWS IAM Identity Center resources via Terraform. Map local developer and security groups to matching permission sets.

### Day 15: AWS Threat Detection: CloudTrail & GuardDuty
* **Objective**: Establish organization-wide threat detection telemetry.
* **Concepts**: CloudTrail event delivery, GuardDuty analytics, EventBridge rules.
* **Practice Lab**: Deploy GuardDuty and CloudTrail across your Terraform environment. Configure SNS alerts for severe security threats.

### Day 16: Hybrid Active Directory & Entra Connect
* **Objective**: Synchronize local identity systems with cloud Entra ID.
* **Concepts**: AD DS, ADFS federations, Entra Connect engine, password hash synchronization.
* **Practice Lab**: Create a PowerShell script to audit AD DS user attributes, verifying their schema matches Entra ID expectations.

### Day 17: Privileged Identity Management (PIM) & CA Policies
* **Objective**: Enforce Just-In-Time (JIT) access and Adaptive MFA.
* **Concepts**: Entra ID PIM, Conditional Access (CA) API, Secure Score metrics.
* **Practice Lab**: Code a Python script using Microsoft Graph API to dynamically request a temporary elevation of admin privileges.

### Day 18: LangGraph Core: Graphs & States
* **Objective**: Build stateful agent applications using graphs.
* **Concepts**: Graph State, nodes, edges, conditional routing, compilation.
* **Practice Lab**: Construct a customer service agent in LangGraph. Define state schemas and write routing rules to steer queries based on user intent.

### Day 19: LangGraph State Persistence & Time Travel
* **Objective**: Maintain conversational state across long durations and allow status recovery.
* **Concepts**: Checkpointers, SQLite savers, thread IDs, state injection.
* **Practice Lab**: Add SQLite state persistence to your LangGraph agent. Demonstrate pausing, resuming, and rolling back conversational states to previous turns.

### Day 20: Human-in-the-Loop (HITL) Gateways
* **Objective**: Interrupt agent graph flows to wait for human verification.
* **Concepts**: Breakpoints, input interception, manual state updates, resuming nodes.
* **Practice Lab**: Design a graph node that halts execution and requests manual admin permission before invoking a data modification tool.

### Day 21: Multi-Agent Architectures & Supervision
* **Objective**: Orchestrate multiple specialized agents under a central manager.
* **Concepts**: Supervisor agents, specialized actor routing, state passing, context scoping.
* **Practice Lab**: Build a system where a supervisor agent receives a complex query and delegates sub-tasks to a "Coder" agent and a "Writer" agent.

### Day 22: Short-Term vs. Long-Term Agentic Memory
* **Objective**: Structure memory models for context persistence and fast recalls.
* **Concepts**: Conversational Buffer, sliding windows, persistent Postgres memory layers.
* **Practice Lab**: Build an agent that maintains active context in memory while asynchronously reading long-term preferences from Supabase.

### Day 23: Advanced Memory: Abstractive Summary Buffers
* **Objective**: Manage token consumption in long-running chats.
* **Concepts**: Token budgets, summary buffer, LLM-driven chat condensation.
* **Practice Lab**: Program a custom summarization edge in LangGraph that condenses chat logs into abstractive summaries when token length exceeds a threshold.

### Day 24: Entity & Semantic Memory Routing
* **Objective**: Track structured metadata about real-world entities.
* **Concepts**: Entity extraction, metadata trees, memory routing vectors.
* **Practice Lab**: Write an agent that extracts user information (e.g., cloud provider, tool stacks) and queries specific memory databases based on extracted tags.

### Day 25: Vector DBs: ChromaDB & Metadata Filtration
* **Objective**: Build efficient vector retrieval indexes.
* **Concepts**: Embeddings, cosine similarity, ChromaDB collections, metadata query filters.
* **Practice Lab**: Set up a local ChromaDB instance, ingest a dataset, and query entries using exact metadata filters paired with semantic vector search.

### Day 26: Hybrid Search: BM25 & Reciprocal Rank Fusion (RRF)
* **Objective**: Merge keyword indices and vector indices for high accuracy.
* **Concepts**: BM25 keyword matching, dense vector indexes, RRF scoring logic.
* **Practice Lab**: Write a Python search module combining BM25 and ChromaDB outputs using the RRF algorithm to produce a re-ranked list of matching documents.

### Day 27: Model Context Protocol (MCP) Server Construction
* **Objective**: Expose localized utilities and resources to AI agents via the MCP protocol.
* **Concepts**: MCP architecture, JSON-RPC, schema definitions, custom resource mappings.
* **Practice Lab**: Write a custom MCP server in Python that exposes secure commands to read system diagnostics and passes them to an LLM.

### Day 28: Multi-Agent Frameworks: CrewAI & AutoGen
* **Objective**: Prototype workflows using out-of-the-box orchestrators.
* **Concepts**: Crew roles, agent tasks, AutoGen conversation patterns.
* **Practice Lab**: Design a multi-agent workflow in CrewAI to research security logs and compare its state management with LangGraph.

### Days 29–30: Phase 2 Project: Stateful AI Security Concierge
* **Objective**: Build a persistent, stateful agent that assists administrators.
* **Concepts**: Integrating LangGraph, SQLite checkpointers, Supabase DB, custom MCP server.
* **Practice Lab**: Build an agent that queries user directories via MCP, uses RLS policies on Supabase to log access, and triggers an approval breakpoint (HITL) before modifying tenant configurations.

---

## 📌 Phase 3: Deepening Expertise & Complex Projects (Days 31–60)
*Goal: Master production-level container orchestration, strict compliance auditing, AI security guardrails, performance profiling, and build a massive capstone system.*

---

### Day 31: Kubernetes Core Manifests & Services
* **Objective**: Define containerized topologies on Kubernetes.
* **Concepts**: Pods, Deployments, services (ClusterIP, NodePort, LoadBalancer), ingress.
* **Practice Lab**: Write YAML manifests deploying a scalable Python microservice with liveness probes and path-based ingress routing.

### Day 32: Production Amazon EKS Architecture
* **Objective**: Spin up enterprise-ready Kubernetes infrastructure.
* **Concepts**: VPC CNI, Managed Node Groups, IAM Roles for Service Accounts (IRSA).
* **Practice Lab**: Write Terraform code to deploy an EKS cluster running within isolated subnets, mapped to AWS IAM permissions.

### Day 33: Kubernetes Workload Security: 1Password & CrowdStrike
* **Objective**: Protect cluster namespaces and secret injection.
* **Concepts**: ExternalSecrets Operator, 1Password credentials synchronization, CrowdStrike Falcon agent runtime protection.
* **Practice Lab**: Deploy the ExternalSecrets operator on EKS, syncing database keys from a secure external system.

### Day 34: Perimeter Protection: Cloudflare Tunnels & Ingress
* **Objective**: Secure entry points to internal web tools.
* **Concepts**: Cloudflare Tunnels, zero-trust network access, ingress routing.
* **Practice Lab**: Configure a Cloudflare Tunnel to expose your local Kubernetes service without opening public firewall ports.

### Day 35: Observability: Datadog & GitLab CI Deployments
* **Objective**: Implement metrics tracking dashboards and automatic pipeline deployments.
* **Concepts**: Datadog Agent DaemonSets, Helm configurations, GitLab runners.
* **Practice Lab**: Deploy Datadog collectors to your EKS cluster using Helm, and configure alerts for pod memory saturation.

### Day 36: SIEM Integration: Sentinel & Splunk Ingestion
* **Objective**: Centralize identity and infrastructure security events.
* **Concepts**: Sentinel KQL query parsing, Splunk ingestion pipelines.
* **Practice Lab**: Write a KQL query inside Microsoft Sentinel to detect consecutive administrative logins from disparate geological IPs within 5 minutes.

### Day 37: Compliance Frameworks: SOC 2, ISO 27001, NIST Audits
* **Objective**: Map IT setups to regulatory compliance criteria.
* **Concepts**: Access control policy matrices, encryption auditing, NIST SP 800-53.
* **Practice Lab**: Perform a mock audit on your Terraform repositories and generate a compliance matrix detailing missing SOC 2 controls.

### Day 38: Zero Trust Network Architecture & Incident Response
* **Objective**: Design networks assuming absolute perimeter compromise.
* **Concepts**: Micro-segmentation, continuous verification, Incident Response playbooks.
* **Practice Lab**: Create a detailed runbook for isolating compromised Kubernetes namespaces and terminating linked active sessions.

### Day 39: NVIDIA NeMo Guardrails: Jailbreak Protection
* **Objective**: Prevent prompt injection and adversarial attacks.
* **Concepts**: NeMo configs, Colang expression definitions, input filtering.
* **Practice Lab**: Implement a NeMo Guardrails configuration that blocks incoming user prompts containing system-instruction override commands.

### Day 40: Custom Colang Flows & Output Shielding
* **Objective**: Direct LLM conversational behaviors.
* **Concepts**: Colang files, Python action integration, output validation.
* **Practice Lab**: Code a Colang flow that intercepts agent replies and scans them for unauthorized data leakage (e.g. system paths) before responding.

### Day 41: AWS Bedrock Guardrails & Llama Firewall
* **Objective**: Mask sensitive parameters and filter cloud-native AI payloads.
* **Concepts**: PII masking, Llama Firewall weights, AWS Bedrock policy configurations.
* **Practice Lab**: Set up Bedrock Guardrails to automatically detect and redact names, emails, and phone numbers from LLM inputs.

### Day 42: LLM Evaluation: Ragas Framework & Golden Datasets
* **Objective**: Quantify retrieval-augmented generation accuracy.
* **Concepts**: Ragas, Golden datasets, LLM-as-a-Judge architecture.
* **Practice Lab**: Create a golden evaluation dataset with 20 Q&A pairs. Execute Ragas scripts to benchmark context extraction accuracy.

### Day 43: Evaluation Metrics: Faithfulness & Context Recall
* **Objective**: Analyze mathematical evaluations of LLM behavior.
* **Concepts**: Groundedness formulas, answer relevancy, context precision.
* **Practice Lab**: Write a Python evaluator that calls GPT-4 to calculate a mathematical precision score of fetched references compared to the generated response.

### Day 44: Custom Python Evaluation Engines
* **Objective**: Build tailor-made testing wrappers for domain-specific agent loops.
* **Concepts**: Custom scoring, evaluation loops, logging test traces.
* **Practice Lab**: Code a Python testing script that checks agent outputs against a JSON schema, scoring correctness based on expected entity values.

### Day 45: Agent Tracing: Langfuse & LangSmith
* **Objective**: Profile multi-actor execution costs and nested delays.
* **Concepts**: Langfuse SDK integration, span definitions, token accounting, tracing waterfalls.
* **Practice Lab**: Decorate your LangGraph agents to stream telemetry to Langfuse, identifying which sub-nodes cause the most latency.

### Day 46: Pydantic Logfire & FastAPI Metrics
* **Objective**: Instrument applications with telemetry.
* **Concepts**: Logfire spans, FastAPI integration, DB transaction tracking.
* **Practice Lab**: Instrument your FastAPI application using Pydantic Logfire, creating custom spans to track database query times.

### Day 47: Load Testing: Locust Concurrency Benchmarks
* **Objective**: Benchmark scaling limits of backend endpoints.
* **Concepts**: Locust configurations, concurrent user ramp-up, throughput.
* **Practice Lab**: Run a Locust script that fires 100 concurrent requests per second at your FastAPI endpoint, mapping response-time histograms.

### Day 48: Advanced Memory: Ebbinghaus Forgetting Curves
* **Objective**: Program memory retention policies.
* **Concepts**: Half-life decay scoring, timestamp weighting, vector search relevance formulas.
* **Practice Lab**: Write a Python memory retrieval method that calculates decay: `Relevance = BaseScore * 2^(-t / T_half)`. Filter expired parameters.

### Day 49: Loop Engineering: Build-Measure-Learn Iteration
* **Objective**: Code self-improving agents.
* **Concepts**: Iterative compilation loops, objective metrics, stop conditions.
* **Practice Lab**: Write a LangGraph agent that writes a unit test, runs a CLI tool to execute it, parses error stack traces, and edits the code until tests pass.

### Day 50: Continuous Loop Optimization
* **Objective**: Build agents that refine prompt templates over multiple execution trials.
* **Concepts**: Prompt optimization, automated feedback loops.
* **Practice Lab**: Write an agent that critiques its own output over 5 iterations and yields the highest-scoring response according to an evaluation node.

### Days 51–60: Phase 3 Capstone: BPGpt - Enterprise Identity & Security Agent
* **Objective**: Consolidate every skill in this program into an enterprise-grade agent.
* **Concepts**: Full-stack integration of Kubernetes, AWS, Terraform, Supabase, n8n, LangGraph, NeMo Guardrails, Ragas, and Datadog.
* **Practice Lab Breakdown**:
  * **Days 51–52**: Design EKS topologies and write database schemas in Supabase with strict RLS configurations.
  * **Days 53–54**: Write n8n workflow engines to extract tenant authentication events and write them to Supabase.
  * **Days 55–56**: Code the stateful LangGraph agent logic with SQLite persistent checkpointers and custom MCP tool definitions.
  * **Days 57–58**: Layer NeMo Guardrails and AWS Bedrock firewalls over inputs/outputs and write a Human-in-the-Loop breakpoint approval.
  * **Day 59**: Write GitHub Actions pipelines that build Docker images, run automated Ragas unit tests, and deploy services to EKS.
  * **Day 60**: Run Locust load tests, simulate prompt injections to verify guardrails, review telemetry dashboards on Logfire, and write the final walkthrough.
