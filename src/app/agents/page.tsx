"use client";
import { useEffect, useState } from "react";
import type { Agent } from "@/types/data_base";

export default function AgentsPage() {
  const [agents, setAgents] = useState<Agent[]>([]);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetch("/api/agents")
      .then((r) => r.json())
      .then((data) => setAgents(data))
      .catch((err) => setError(err.message));
  }, []);

  if (error) return <div>Error: {error}</div>;
  if (!agents.length) return <div>No agents found.</div>;

  return (
    <div>
      <h1 className="text-4xl font-bold text-textLight mb-4">Agents</h1>
      <p className="text-lg text-cardLight">Home sweet home</p>
      <ul>
        {agents.map(agent => (
          <li key={agent.agent_id}>
            ID: {agent.agent_id} — {agent.email}
          </li>
        ))}
      </ul>
    </div>
  );
}
