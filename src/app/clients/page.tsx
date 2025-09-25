"use client";

import React from "react";
import useSWR from "swr";
import Layout from "@/components/Layout";
import Link from "next/link";
import type { Client } from "@/types/data_base";

const fetcher = (url: string) => fetch(url).then((res) => res.json());

export default function ClientsPage() {
  const { data, error } = useSWR<Client[]>("/api/clients", fetcher);

  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;

  return (
    <Layout>
          <h1 className="text-4xl font-bold text-textLight mb-4">Clients</h1>
          <p className="text-lg text-cardLight">O gramada de clienti...</p>
      <ul>
        {data.map((client: Client) => (
          <li key={client.client_id}>
            <Link href={`/clients/${client.client_id}`}>{client.client_name}</Link>
          </li>
        ))}
      </ul>
    </Layout>
  );
}