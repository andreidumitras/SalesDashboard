import { supabaseServer } from "../supabaseServer";
import { Client } from "../../types/data_base";

async function getAll(): Promise<Client[]> {
    const { data, error } = await supabaseServer
        .from("Clients")
        .select("*");

    if (error) {
        throw new Error(`Error fetching clients: ${error.message}`);
    }

    return data as Client[];
}

export const clientRepo = {
    getAll,
    createClient,
    getClientID,
    updateClient,
    deleteClient
};

async function createClient(client: Client): Promise<Client> {
    const { data, error } = await supabaseServer
        .from("Clients")
        .insert([client])
        .select("*");

    if (error) {
        throw new Error(`Error creating client: ${error.message}`);
    }

    return data[0] as Client;
}

async function getClientID(client_id: number): Promise<string | null> {
    const { data, error } = await supabaseServer
        .from("Clients")
        .select("id")
        .eq("id", client_id)
        .single();

    if (error) {
        throw new Error(`Error fetching client ID: ${error.message}`);
    }

    return data?.id || null;
}

async function updateClient(client_id: number, updates: Partial<Client>): Promise<Client> {
    const { data, error } = await supabaseServer
        .from("Clients")
        .update(updates)
        .eq("id", client_id)
        .select("*")
        .single();

    if (error) {
        throw new Error(`Error updating client: ${error.message}`);
    }

    return data as Client;
}

async function deleteClient(client_id: number): Promise<void> {
    return new Promise(async (resolve, reject) => {
        const { error } = await supabaseServer
            .from("Clients")
            .delete()
            .eq("id", client_id);

        if (error) {
            reject(new Error(`Error deleting client: ${error.message}`));
        } else {
            resolve();
        }
    });
}
