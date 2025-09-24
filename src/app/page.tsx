import AgentsPage from "./agents/agentPage";
import type { Agent } from "../types/data_base";

async function getAgents(): Promise<Agent[]> {
  const res = await fetch('http://localhost:3000/api/agents', {
    cache: "no-store",
  });
  const data = await res.json();
  if (data.error) throw new Error(data.error);
  return data;
}

export default async function Home() {
  let agents: Agent[] = [];
  let error: string | null = null;

  try {
    agents = await getAgents();
  } catch (err: any) {
    error = err.message || "Failed to fetch agents";
  }

  return (
    <div>
      <p>SR Sales Dashboard in progress...</p>
      <AgentsPage agents={agents} error={error} />
    </div>
  );
}