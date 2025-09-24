import type { Agent } from '../../types/data_base';

type AgentsPageProps = {
  agents: Agent[];
  error?: string | null;
};

export default function AgentsPage({ agents, error }: AgentsPageProps) {
  if (error) return <div>Error: {error}</div>;
  if (!agents || agents.length === 0) {
    return <div>No agents found.</div>;
  }

  return (
    <div>
      <h1>Agents</h1>
      <ul>
        {agents.map(agent => (
          <li key={agent.agent_id}>
            Agent ID: {agent.agent_id} <br />
            Email: {agent.email}
          </li>
        ))}
      </ul>
    </div>
  );
}