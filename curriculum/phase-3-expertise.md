# 📌 Phase 3: Expertise & Capstone (Days 31–60)

*Goal: Master production deployment (Kubernetes), enterprise security monitoring (SIEM), AI guardrails, evaluation metrics, and deliver a flagship agentic application.*

---

## Day 31: Kubernetes Core (Minikube)

**🎯 Objective:** Understand container orchestration primitives.
**📖 Learn:** 
- [Kubernetes Official Tutorials (1.5 hrs)](https://kubernetes.io/docs/tutorials/)
**🛠️ Practice:** Deploy your FastAPI app to a local Minikube cluster using Deployment, Service, and ConfigMap YAML manifests.
**📂 Where:** Local Minikube.
**✅ Ship:** Commit `k8s/deployment.yaml` and `k8s/service.yaml` to `labs/day-31-k8s/`.
**📝 Post:** "Moving from Docker Compose to Kubernetes. Deployed my first container orchestration cluster locally with Minikube today. #Kubernetes #DevOps"
**🔗 Connect to Security:** Hardening Kubernetes (RBAC, Pod Security Standards, Network Policies) is critical. If an agent runs in a pod with `privileged: true`, a container escape gives the agent host-level root access.

---

## Day 32: EKS Architecture & Provisioning

**🎯 Objective:** Deploy managed Kubernetes in the cloud.
**📖 Learn:** 
- [EKS Workshop (1 hr)](https://www.eksworkshop.com/)
**🛠️ Practice:** Use Terraform (the `terraform-aws-modules/eks/aws` module) to provision an EKS cluster with managed node groups. *(Destroy it immediately after testing to save costs).*
**📂 Where:** AWS Free Tier (EKS costs ~$0.10/hr).
**✅ Ship:** Commit the Terraform EKS module definition to `labs/day-32-eks/`.
**📝 Post:** "Provisioning AWS EKS via Terraform. Infrastructure as Code makes complex cloud-native architectures repeatable. #AWS #EKS"
**🔗 Connect to Security:** EKS introduces IAM Roles for Service Accounts (IRSA). This is the gold standard for NHI identity—pods get short-lived tokens to access AWS resources instead of hardcoded secrets.

---

## Day 33: Kubernetes Security & Helm

**🎯 Objective:** Package and secure K8s deployments.
**📖 Learn:** 
- [Helm Docs (45m)](https://helm.sh/docs/)
**🛠️ Practice:** Package your application into a Helm chart. Implement a `securityContext` in the deployment ensuring `runAsNonRoot: true` and `allowPrivilegeEscalation: false`.
**📂 Where:** Local Minikube.
**✅ Ship:** Commit the Helm chart structure to `labs/day-33-helm/`.
**📝 Post:** "Hardening Kubernetes pods. Wrote my first Helm chart today and enforced strict Pod Security Standards. #DevSecOps #Kubernetes"
**🔗 Connect to Security:** Helm charts often pull public images. Scanning these images with tools like Trivy in your CI/CD pipeline prevents deploying known CVEs to your cluster.

---

## Day 34: Cloudflare Tunnels (Zero Trust)

**🎯 Objective:** Expose local services securely without opening inbound ports.
**📖 Learn:** 
- [Cloudflare Tunnels Docs (1 hr)](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)
**🛠️ Practice:** Install `cloudflared`. Expose your local Minikube service to the public internet securely using a Cloudflare Tunnel, placing a Zero Trust authentication policy (e.g., GitHub login) in front of it.
**📂 Where:** Local machine + Free Cloudflare account.
**✅ Ship:** Commit a screenshot of the Zero Trust access screen to `labs/day-34-tunnels/README.md`.
**📝 Post:** "Exposing local apps to the internet without opening firewall ports. Set up Cloudflare Tunnels with Zero Trust auth in front of my Kubernetes cluster. #ZeroTrust #Networking"
**🔗 Connect to Security:** Ingress exposes attack surface. Tunnels reverse the connection (outbound-only). Putting Zero Trust policies in front of agent endpoints ensures only authenticated entities can trigger your AI workflows.

---

## Day 35: Sentinel, Splunk & KQL

**🎯 Objective:** Query and correlate security telemetry at scale.
**📖 Learn:** 
- [Microsoft Learn — KQL (1 hr)](https://learn.microsoft.com/en-us/training/paths/sc-200-utilize-kql-for-azure-sentinel/)
**🛠️ Practice:** Use the Log Analytics Demo environment to write KQL queries that detect anomalous sign-ins (e.g., impossible travel or multiple failures followed by a success).
**📂 Where:** [Log Analytics Demo Environment](https://aka.ms/lademo).
**✅ Ship:** Commit your KQL detection rules to `labs/day-35-kql/`.
**📝 Post:** "Threat hunting with KQL. Wrote detection rules for impossible travel and brute-force attacks in Azure Sentinel today. #SecOps #ThreatHunting"
**🔗 Connect to Security:** When an NHI (Service Principal) behaves anomalously, SIEM rules (KQL/SPL) are how the SOC detects the breach. You must know how to monitor the identities you create.

---

## Day 36: Compliance Frameworks (SOC 2 / ISO 27001)

**🎯 Objective:** Map technical controls to regulatory requirements.
**📖 Learn:** Review your existing SOC 2 / compliance documentation from past work, plus the [AICPA Trust Services Criteria](https://www.aicpa-cima.com/resources/download/trust-services-criteria).
**🛠️ Practice:** Write a Markdown document mapping the technical controls you've learned (SSO, Terraform, GuardDuty, RLS) to specific SOC 2 criteria (e.g., CC6.1 Logical Access).
**📂 Where:** Local Markdown.
**✅ Ship:** Commit the control mapping matrix to `labs/day-36-compliance/`.
**📝 Post:** "Security isn't just tech, it's proof. Mapped my cloud infrastructure controls to SOC 2 compliance criteria today. #Compliance #SOC2"
**🔗 Connect to Security:** AI agents complicate compliance. If an agent touches PII, how do you prove to an auditor that the agent didn't exfiltrate it? (Hint: Guardrails, which is the next topic).

---

## Day 37: NeMo Guardrails Core

**🎯 Objective:** Intercept and filter LLM inputs/outputs deterministically.
**📖 Learn:** 
- [NeMo Guardrails GitHub & Getting Started (1 hr)](https://github.com/NVIDIA/NeMo-Guardrails)
**🛠️ Practice:** Set up a basic NeMo Guardrails Python script that intercepts prompts asking about politics or off-topic subjects and returns a canned safe response.
**📂 Where:** Local Python.
**✅ Ship:** Commit `config.yml` and `app.py` to `labs/day-37-nemo/`.
**📝 Post:** "LLMs are unpredictable. Guardrails are deterministic. Implemented NVIDIA NeMo Guardrails today to hard-code safe boundaries around my AI agent. #AIEngineering #Security"
**🔗 Connect to Security:** Guardrails are the WAF (Web Application Firewall) for AI. They prevent Jailbreaks, Prompt Injections, and unintended topic drift before the prompt even reaches the LLM.

---

## Day 38: Colang Flows & Advanced Guardrails

**🎯 Objective:** Program conversational boundaries using Colang.
**📖 Learn:** 
- [Colang Language Guide (1 hr)](https://github.com/NVIDIA/NeMo-Guardrails/blob/develop/docs/user_guides/colang-2/overview.md)
**🛠️ Practice:** Write a `.co` file that defines a specific dialog flow. If the user asks for a destructive action (like database deletion), the flow intercepts it, logs the attempt, and refuses gracefully.
**📂 Where:** Local Python.
**✅ Ship:** Commit `security.co` to `labs/day-38-colang/`.
**📝 Post:** "Programming the conversation flow. Used Colang today to build deterministic interception flows for dangerous LLM requests. #LLMSecurity"
**🔗 Connect to Security:** Colang allows you to define "rail-switching" behavior. If a prompt triggers an intent matching an attack vector, the rail switches to a containment flow, logging the telemetry for the SIEM.

---

## Day 39: Bedrock Guardrails & Llama Guard

**🎯 Objective:** Explore provider-managed and model-based safety filters.
**📖 Learn:** 
- [Llama Guard on HuggingFace (30m)](https://huggingface.co/meta-llama/Llama-Guard-3-8B)
**🛠️ Practice:** Use Ollama to run `llama-guard3`. Pass a malicious prompt (e.g., "how to build a bomb") through Llama Guard and parse the `unsafe` output classification.
**📂 Where:** Local Python + Ollama.
**✅ Ship:** Commit `safety_filter.py` to `labs/day-39-llama-guard/`.
**📝 Post:** "Evaluating prompts with Llama Guard 3. You can run Meta's safety classifier locally to filter inputs before they hit your expensive reasoning models. #AI #OpenSource"
**🔗 Connect to Security:** While NeMo uses heuristic rails, Llama Guard uses a specialized LLM trained exclusively on safety taxonomy (violence, hate, PII). A defense-in-depth approach uses both.

---

## Day 40: Ragas (Retrieval Augmented Generation Assessment)

**🎯 Objective:** Quantify the performance and accuracy of RAG pipelines.
**📖 Learn:** 
- [Ragas Docs (1 hr)](https://docs.ragas.io/)
**🛠️ Practice:** Build a script that evaluates a mock RAG answer against a context chunk using Ragas metrics: Answer Relevancy and Context Precision.
**📂 Where:** Local Python.
**✅ Ship:** Commit `evaluate.py` to `labs/day-40-ragas/`.
**📝 Post:** "Vibes are not a metric. Implemented Ragas (RAG Assessment) to mathematically score my agent's context precision and answer relevancy. #LLMOps #RAG"
**🔗 Connect to Security:** Hallucinations are a security risk if an agent takes action based on false data. Ragas metrics help ensure the LLM remains grounded in the provided context (Context Faithfulness).

---

## Day 41: Evaluation Datasets & CI/CD

**🎯 Objective:** Automate LLM testing in deployment pipelines.
**📖 Learn:** 
- [Ragas Test Generation (30m)](https://docs.ragas.io/en/stable/getstarted/testset_generation/)
**🛠️ Practice:** Generate a "golden dataset" of 10 Q&A pairs. Write a `pytest` suite that evaluates your agent against this dataset, failing the build if the Ragas score drops below 0.8.
**📂 Where:** Local Python.
**✅ Ship:** Commit `test_agent.py` and `golden_dataset.json` to `labs/day-41-evals/`.
**📝 Post:** "Unit testing for LLMs. Built an automated evaluation pipeline that fails the CI build if the agent's accuracy drops below 80%. #MLOps #Testing"
**🔗 Connect to Security:** This is red-teaming as code. Your golden dataset should include prompt injection attempts; the tests ensure the agent's safety score remains high across updates.

---

## Day 42: LLM Observability (Langfuse)

**🎯 Objective:** Trace LLM executions, token usage, and latencies.
**📖 Learn:** 
- [Langfuse Docs (1 hr)](https://langfuse.com/docs)
**🛠️ Practice:** Integrate the Langfuse Python SDK into your LangChain/LangGraph agent. Run several queries and view the execution traces in the Langfuse UI.
**📂 Where:** Local Python + Langfuse Cloud Free Tier.
**✅ Ship:** Commit the instrumented agent code to `labs/day-42-langfuse/`.
**📝 Post:** "You can't fix what you can't see. Added Langfuse observability to my agents to trace execution paths, token costs, and latencies. #LLMOps #Observability"
**🔗 Connect to Security:** Observability is how you detect abuse (e.g., someone trying to extract your system prompt). Langfuse allows you to monitor exactly what the agent is doing in production.

---

## Day 43: Pydantic Logfire

**🎯 Objective:** Unify application telemetry with LLM tracing.
**📖 Learn:** 
- [Logfire Docs (1 hr)](https://logfire.pydantic.dev/)
**🛠️ Practice:** Add Logfire to your FastAPI application to trace HTTP requests alongside the LangChain execution spans.
**📂 Where:** Local Python + Logfire Free Tier.
**✅ Ship:** Commit `instrumented_api.py` to `labs/day-43-logfire/`.
**📝 Post:** "Full-stack observability for AI apps. Pydantic Logfire traces everything from the HTTP request down to the LLM tool call. #Python #DevOps"
**🔗 Connect to Security:** Complete end-to-end tracing is required for incident response. If an agent executes a malicious tool, you must trace the request back to the originating IP and authenticated user.

---

## Day 44: Load Testing with Locust

**🎯 Objective:** Validate application resilience under pressure.
**📖 Learn:** 
- [Locust Docs (1 hr)](https://docs.locust.io/)
**🛠️ Practice:** Write a `locustfile.py` that simulates 100 concurrent users hitting your FastAPI agent endpoint. Analyze the response time degradation.
**📂 Where:** Local Python.
**✅ Ship:** Commit `locustfile.py` to `labs/day-44-locust/`.
**📝 Post:** "Stress testing AI APIs. Used Locust today to simulate 100 concurrent users hitting my agent. Found and fixed bottlenecked DB queries. #Performance #Python"
**🔗 Connect to Security:** LLM APIs are slow and computationally expensive. They are highly susceptible to Denial of Service (DoS) attacks. Load testing helps you set appropriate rate limits (which you learned in Day 1).

---

## Day 45: Loop Engineering & Optimization

**🎯 Objective:** Prevent infinite agent loops and optimize token usage.
**📖 Learn:** 
- Review LangGraph iteration limits.
**🛠️ Practice:** Implement a `max_iterations` counter in your LangGraph state. If the agent fails to complete the task in 5 steps, it gracefully errors out and returns to the user.
**📂 Where:** Local Python.
**✅ Ship:** Commit `optimized_graph.py` to `labs/day-45-loop-engineering/`.
**📝 Post:** "Preventing the dreaded infinite LLM loop. Added hard iteration limits to my LangGraph state machine to protect my token budget. #AI #Engineering"
**🔗 Connect to Security:** Infinite loops burn API credits rapidly (Denial of Wallet). Hard-coded iteration limits are a necessary architectural safeguard.

---

## Days 46–50: BPGpt Capstone — Planning & Infrastructure

**🎯 Objective:** Begin building the ultimate flagship portfolio project.
**📖 Learn:** Review the entire curriculum.
**🛠️ Practice:** 
- **Day 46:** Architecture design and Terraform provisioning.
- **Day 47:** Database (Supabase) and Auth setup.
- **Day 48:** Base API (FastAPI) and observability (Logfire) integration.
- **Day 49:** Tool creation and MCP server setup.
- **Day 50:** Vector Database (ChromaDB) and document embedding pipeline.
**📂 Where:** Your local machine + cloud environments.
**✅ Ship:** Commit progress daily to `projects/phase-3-bpgpt/`.
**📝 Post:** Document the architecture and daily progress on LinkedIn.

---

## Days 51–60: BPGpt Capstone — Agents, Evals, & Launch

**🎯 Objective:** Complete and deploy the flagship project.
**🛠️ Practice:** 
- **Day 51-54:** Build the LangGraph multi-agent system with memory and HITL.
- **Day 55:** Implement NeMo Guardrails.
- **Day 56-57:** Write the Ragas evaluation test suite and configure GitHub Actions CI.
- **Day 58:** Containerize with Docker and Helm.
- **Day 59:** Deploy to local Minikube and expose via Cloudflare Tunnels.
- **Day 60:** Record a 2-minute demo video and publish the repository.
**📂 Where:** `projects/phase-3-bpgpt/`.
**✅ Ship:** The final, polished GitHub repository.
**📝 Post:** **LAUNCH DAY.** Post the demo video, link to the repo, and tag relevant tech communities.
**🔗 Connect to Security:** This project is the culmination of your GOD-TIER plan. It proves you understand how to build complex AI systems securely, addressing the exact NHI/Agentic Identity vulnerabilities that enterprise organizations are currently facing.
