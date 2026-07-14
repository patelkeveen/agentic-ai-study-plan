# 📌 Phase 2: Leveling Up & Projects (Days 11–30)

*Goal: Deploy secure, cloud-native infrastructure, understand enterprise identity governance, and build stateful, multi-agent LLM systems with proper memory.*

---

## Day 11: Terraform Provisioning

**🎯 Objective:** Automate cloud infrastructure creation using Infrastructure as Code (IaC).
**📖 Learn:** 
- [HashiCorp Terraform Tutorials (1.5 hrs)](https://developer.hashicorp.com/terraform/tutorials)
**🛠️ Practice:** Write Terraform to provision an AWS VPC, public/private subnets, and an EC2 instance.
**📂 Where:** AWS Free Tier account + local VS Code.
**✅ Ship:** Commit `main.tf`, `variables.tf`, and `providers.tf` to `labs/day-11-terraform/`.
**📝 Post:** "Infrastructure as Code is mandatory. Provisioned my first AWS VPC and EC2 instance entirely via Terraform today. #Terraform #AWS"
**🔗 Connect to Security:** Manual clicking in cloud consoles leads to misconfigurations (e.g., public S3 buckets). Terraform allows you to define infrastructure security policies as code and scan them *before* deployment using tools like Checkov or Trivy.

---

## Day 12: Modular Terraform & State Management

**🎯 Objective:** Structure Terraform for enterprise scale using modules and remote state.
**📖 Learn:** 
- [Terraform Modules Guide (1 hr)](https://developer.hashicorp.com/terraform/tutorials/modules)
**🛠️ Practice:** Refactor Day 11 into a reusable VPC module. Configure an S3 backend for remote state storage with DynamoDB state locking.
**📂 Where:** AWS Free Tier.
**✅ Ship:** Commit the module structure and `backend.tf` to `labs/day-12-terraform-modules/`.
**📝 Post:** "Refactoring Terraform: Moved from monolithic files to reusable modules with remote S3 state backend. Ready for team collaboration. #DevOps #IaC"
**🔗 Connect to Security:** The Terraform state file (`terraform.tfstate`) contains plaintext secrets (database passwords, API keys). Securing the S3 backend with strict IAM policies and encryption at rest is a critical NHI security control.

---

## Day 13: AWS Organizations & SCPs

**🎯 Objective:** Enforce security guardrails across multiple cloud accounts.
**📖 Learn:** 
- [AWS SCP Documentation (1 hr)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
**🛠️ Practice:** Create an AWS Organization. Write a Service Control Policy (SCP) that prevents any IAM user from disabling CloudTrail, and apply it to a sandbox OU.
**📂 Where:** AWS Free Tier.
**✅ Ship:** Commit the JSON SCP document to `labs/day-13-aws-orgs/`.
**📝 Post:** "Service Control Policies (SCPs) are the ultimate cloud guardrail. Wrote a policy today that blocks anyone (even root) from turning off audit logs. #AWS #CloudSecurity"
**🔗 Connect to Security:** SCPs provide preventative governance. If an AI agent running in a sub-account goes rogue or is compromised, SCPs ensure it cannot escalate privileges or delete forensic logs.

---

## Day 14: AWS IAM Identity Center (SSO)

**🎯 Objective:** Centralize human and non-human access to cloud resources.
**📖 Learn:** 
- [AWS IAM Identity Center Docs (1 hr)](https://docs.aws.amazon.com/singlesignon/)
**🛠️ Practice:** Enable Identity Center. Create permission sets (e.g., ReadOnly, PowerUser) and assign them to a test user. Configure the AWS CLI to use SSO login.
**📂 Where:** AWS Free Tier.
**✅ Ship:** Commit a screenshot of your CLI SSO login success to `labs/day-14-iam-identity-center/README.md`.
**📝 Post:** "Long-lived IAM access keys are a security liability. Set up AWS IAM Identity Center today for short-lived, SSO-backed CLI access. #CloudSecurity #IAM"
**🔗 Connect to Security:** Hardcoded IAM access keys (`AKIA...`) are the #1 cause of cloud breaches. Migrating to Identity Center (and Workload Identity Federation for agents) eliminates long-lived static credentials.

---

## Day 15: CloudTrail & GuardDuty

**🎯 Objective:** Monitor and detect malicious activity in the cloud.
**📖 Learn:** 
- [AWS Security Workshop: GuardDuty (1 hr)](https://catalog.workshops.aws/guardduty/)
**🛠️ Practice:** Enable CloudTrail logging to an S3 bucket. Enable GuardDuty. Simulate a threat (e.g., accessing an EC2 instance from a Tor exit node IP) and view the GuardDuty finding.
**📂 Where:** AWS Free Tier.
**✅ Ship:** Commit the GuardDuty finding JSON to `labs/day-15-threat-detection/`.
**📝 Post:** "Cloud threat detection in action. Enabled AWS GuardDuty and generated a synthetic finding to test the alerting pipeline. #AWS #SecOps"
**🔗 Connect to Security:** Agentic AI systems operate at machine speed. You need machine-speed detection (GuardDuty) to identify when an NHI starts making anomalous API calls (e.g., attempting to dump databases).

---

## Day 16: Hybrid AD & Entra Connect

**🎯 Objective:** Bridge on-premises identity with the cloud.
**📖 Learn:** 
- Continue Raghuveer Singh SC-300 course (Module on Hybrid Identity).
**🛠️ Practice:** (Theory/Review) Document the exact synchronization flow between on-prem Active Directory and Entra ID. Detail what PTA (Pass-Through Authentication) and PHS (Password Hash Sync) do.
**📂 Where:** Local Markdown editor.
**✅ Ship:** Commit an architecture diagram (Mermaid.js) of Hybrid AD sync to `labs/day-16-entra-connect/`.
**📝 Post:** "Studying the SC-300: Mapping out the differences between Password Hash Sync and Pass-Through Authentication for Hybrid Entra ID environments. #MicrosoftSecurity #Identity"
**🔗 Connect to Security:** Attackers often compromise on-prem AD to pivot to Entra ID (Golden SAML / DCSync). Understanding this bridge is essential for securing enterprise identities.

---

## Day 17: PIM & Conditional Access

**🎯 Objective:** Enforce Just-In-Time (JIT) access and context-aware authorization.
**📖 Learn:** 
- Continue Raghuveer Singh SC-300 course (PIM & CA modules).
**🛠️ Practice:** Write out the JSON definition for a Conditional Access policy that requires MFA and a compliant device for all administrators.
**📂 Where:** M365 Developer Sandbox (Free E5 tenant) or local Markdown.
**✅ Ship:** Commit the CA policy JSON and PIM role definitions to `labs/day-17-pim-ca/`.
**📝 Post:** "Zero Trust means no standing privileges. Designing Conditional Access and Privileged Identity Management (PIM) policies today. #ZeroTrust #EntraID"
**🔗 Connect to Security:** Conditional access is for humans. For AI agents (Service Principals), you must implement continuous access evaluation and strict API permission scoping (Application vs. Delegated permissions).

---

## Day 18: LangGraph Core

**🎯 Objective:** Build cyclical, stateful agent workflows (nodes and edges).
**📖 Learn:** 
- [LangGraph Official Docs (1 hr)](https://langchain-ai.github.io/langgraph/)
**🛠️ Practice:** Build a basic LangGraph agent with a "reasoning" node and an "action" node (tool execution) that loops until a condition is met.
**📂 Where:** Local Python + Gemini API.
**✅ Ship:** Commit `graph.py` to `labs/day-18-langgraph/`.
**📝 Post:** "Linear LLM chains are dead. State machines are the future. Built my first looping agent with LangGraph today. #LangGraph #AgenticAI"
**🔗 Connect to Security:** LangGraph gives you deterministic control over the execution flow. You can enforce security checks by placing a "security validator" node on every edge transition before a tool executes.

---

## Day 19: State Persistence & Time Travel

**🎯 Objective:** Give agents memory across sessions and the ability to rewind.
**📖 Learn:** 
- [LangGraph Persistence (45m)](https://langchain-ai.github.io/langgraph/concepts/persistence/)
**🛠️ Practice:** Add a SQLite checkpointer to your Day 18 graph. Pause execution, inspect the state, alter the state manually, and resume execution (Time Travel).
**📂 Where:** Local Python.
**✅ Ship:** Commit updated `graph.py` to `labs/day-19-state-persistence/`.
**📝 Post:** "Added state persistence to my LangGraph agent. It can now pause, wait for input, and even 'time travel' to previous states. #AI #Python"
**🔗 Connect to Security:** State checkpoints are an audit trail. In enterprise environments, persisting agent state allows security teams to forensically reconstruct exactly why an LLM made a specific decision.

---

## Day 20: Human-in-the-Loop (HITL)

**🎯 Objective:** Require human approval before executing sensitive actions.
**📖 Learn:** 
- [LangGraph HITL Concepts (45m)](https://langchain-ai.github.io/langgraph/concepts/human_in_the_loop/)
**🛠️ Practice:** Modify the graph to pause (interrupt) before executing a mock `delete_user` tool, requiring console input (y/n) to proceed.
**📂 Where:** Local Python.
**✅ Ship:** Commit `hitl_agent.py` to `labs/day-20-hitl/`.
**📝 Post:** "Never let an agent run destructive tools autonomously. Implemented Human-in-the-Loop (HITL) approval gates in LangGraph today. #AI #Security"
**🔗 Connect to Security:** HITL is a mandatory mitigation in the OWASP Agentic Top 10 for preventing unintended consequences when agents have write-access to APIs.

---

## Day 21: Multi-Agent Architectures

**🎯 Objective:** Orchestrate specialized agents that talk to each other.
**📖 Learn:** 
- [LangGraph Multi-Agent (1 hr)](https://langchain-ai.github.io/langgraph/concepts/multi_agent/)
**🛠️ Practice:** Build a supervisor agent that delegates tasks to a "Researcher" agent and a "Coder" agent based on the user's prompt.
**📂 Where:** Local Python.
**✅ Ship:** Commit `multi_agent.py` to `labs/day-21-multi-agent/`.
**📝 Post:** "Why use one big prompt when you can use a team of specialists? Built a Supervisor-Worker multi-agent architecture today. #AI #Agents"
**🔗 Connect to Security:** Principle of Least Privilege applies to agents too. A "Researcher" agent shouldn't have access to the `deploy_code` tool. Multi-agent architectures allow you to isolate tools by persona.

---

## Day 22: Agentic Memory Models

**🎯 Objective:** Differentiate between short-term (context window) and long-term memory.
**📖 Learn:** 
- [LangGraph Memory Guide (1 hr)](https://langchain-ai.github.io/langgraph/concepts/memory/)
**🛠️ Practice:** Implement a system prompt that dynamically pulls in the user's profile and past preferences into the context window for every turn.
**📂 Where:** Local Python.
**✅ Ship:** Commit `memory_agent.py` to `labs/day-22-memory/`.
**📝 Post:** "LLMs are stateless, but agents shouldn't be. Implementing structured memory injection for context-aware interactions. #AI #LLM"
**🔗 Connect to Security:** Memory injection is a prime vector for Indirect Prompt Injection. If an agent retrieves a poisoned document and loads it into memory, it can be hijacked.

---

## Day 23: Summary Buffers

**🎯 Objective:** Manage context window limits efficiently.
**📖 Learn:** 
- Research "ConversationSummaryBufferMemory" concepts.
**🛠️ Practice:** Build a function that tracks token usage and, when a threshold is reached, asks a smaller, cheaper model (like Llama 3 8B) to summarize the older conversation history.
**📂 Where:** Local Python + Ollama.
**✅ Ship:** Commit `summary_buffer.py` to `labs/day-23-summary-buffers/`.
**📝 Post:** "Don't blow your token budget on conversation history. Built a sliding window summary buffer to compress old context dynamically. #AI #Optimization"
**🔗 Connect to Security:** Denial of Wallet (DoW) attacks occur when users intentionally fill the context window to maximize API costs. Summary buffers mitigate this risk.

---

## Day 24: Entity & Semantic Memory

**🎯 Objective:** Extract and store structured facts from unstructured chat.
**📖 Learn:** 
- Read about Knowledge Graphs and Entity Extraction via LLMs.
**🛠️ Practice:** Create a tool that the LLM can call to `save_fact(subject, relation, object)`. Connect this to a local SQLite database.
**📂 Where:** Local Python.
**✅ Ship:** Commit `entity_extractor.py` to `labs/day-24-entity-memory/`.
**📝 Post:** "Giving agents persistent knowledge. Built a tool that lets the LLM extract and save facts to a relational database for long-term recall. #AIEngineering"
**🔗 Connect to Security:** If an LLM can save facts, it can be tricked into saving malicious facts ("Admin is user X") which affects future authorizations. Data validation is critical here.

---

## Day 25: ChromaDB & Vector Search

**🎯 Objective:** Store and retrieve high-dimensional embeddings for RAG.
**📖 Learn:** 
- [ChromaDB Docs (1 hr)](https://docs.trychroma.com/)
**🛠️ Practice:** Use `nomic-embed-text` (via Ollama) to embed 10 markdown documents into a local ChromaDB collection, then perform a semantic similarity search.
**📂 Where:** Local Python + Ollama.
**✅ Ship:** Commit `vector_search.py` to `labs/day-25-chromadb/`.
**📝 Post:** "Running vector databases locally. Embedded and searched documents entirely offline using ChromaDB and Ollama. #RAG #VectorDB"
**🔗 Connect to Security:** Vector databases often lack row-level security. If a RAG system retrieves a document the user shouldn't see, it's a data exfiltration vulnerability.

---

## Day 26: BM25 & Reciprocal Rank Fusion

**🎯 Objective:** Combine keyword search with semantic search for better retrieval.
**📖 Learn:** 
- [Elastic RRF Guide (30m)](https://www.elastic.co/guide/en/elasticsearch/reference/current/rrf.html)
**🛠️ Practice:** Implement a BM25 sparse search and fuse its results with your ChromaDB dense search using the Reciprocal Rank Fusion algorithm in Python.
**📂 Where:** Local Python.
**✅ Ship:** Commit `hybrid_search.py` to `labs/day-26-hybrid-search/`.
**📝 Post:** "Vector search isn't enough (it struggles with exact keywords). Implemented Hybrid Search combining BM25 and embeddings with RRF scoring. #Search #AI"
**🔗 Connect to Security:** Attackers use keyword stuffing in documents to manipulate retrieval systems (Data Poisoning). Hybrid search makes retrieval more robust, but still requires input sanitization.

---

## Day 27: MCP Server Construction

**🎯 Objective:** Expose local tools to LLMs using the Model Context Protocol.
**📖 Learn:** 
- [MCP Specification (1 hr)](https://modelcontextprotocol.io/)
**🛠️ Practice:** Build a local MCP server in Python that exposes a `get_weather` tool and a `read_local_file` tool. Connect Claude Desktop to it.
**📂 Where:** Local Python + MCP SDK.
**✅ Ship:** Commit `mcp_server.py` to `labs/day-27-mcp/`.
**📝 Post:** "The Model Context Protocol (MCP) is how we standardize agent tools. Built my first MCP server today to give Claude local file access. #MCP #AI"
**🔗 Connect to Security:** MCP introduces a massive attack surface. If an MCP server exposes a local file read capability without strict path-traversal validation, a compromised LLM can read `/etc/shadow` or your `.env` files.

---

## Day 28: CrewAI & AutoGen (Alternative Frameworks)

**🎯 Objective:** Compare LangGraph against other leading multi-agent frameworks.
**📖 Learn:** 
- [CrewAI Docs (1 hr)](https://docs.crewai.com/)
**🛠️ Practice:** Replicate your Day 21 multi-agent workflow using CrewAI. Note the differences in mental models (Tasks/Agents vs Nodes/Edges).
**📂 Where:** Local Python.
**✅ Ship:** Commit `crew_workflow.py` to `labs/day-28-crewai/`.
**📝 Post:** "Comparing LangGraph vs CrewAI. CrewAI is faster to write, but LangGraph gives you the fine-grained control needed for production. #CrewAI #LangGraph"
**🔗 Connect to Security:** Framework choice dictates security posture. CrewAI's abstraction hides the execution loop, making it harder to implement strict security validation gates compared to LangGraph's state machine.

---

## Days 29–30: Phase 2 Capstone: Security Concierge

**🎯 Objective:** Build a stateful, RAG-enabled agent that audits cloud configurations.
**📖 Learn:** Review Phase 2.
**🛠️ Practice:** Build an agent that uses an MCP server to read local Terraform files, checks them against a vector database of security best practices, and uses LangGraph HITL to propose fixes.
**📂 Where:** Local Python ecosystem.
**✅ Ship:** Commit the full project to `projects/phase-2-security-concierge/`.
**📝 Post:** "Phase 2 Complete. Built a stateful Security Concierge agent that audits Terraform using MCP, ChromaDB, and LangGraph. The ultimate DevSecOps assistant. #BuildInPublic #AI"
**🔗 Connect to Security:** This project demonstrates the exact NHI/Agentic Identity thesis: an agent acting as a security operator, with proper memory, isolated tools, and human approval gates.
