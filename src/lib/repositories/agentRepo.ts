import { supabaseServer } from "../supabaseServer";
import { Agent } from "../../types/data_base";

async function getAll(): Promise<Agent[]> {
    const { data, error } = await supabaseServer
        .from("Agents")
        .select("*");

    if (error) {
        throw new Error(`Error fetching agents: ${error.message}`);
    }

    return data as Agent[];
}

export const getAgents = getAll();