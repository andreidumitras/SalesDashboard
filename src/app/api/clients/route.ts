import { NextResponse } from "next/server";
import { clientRepo } from "../../../lib/repositories/clientRepo";

export async function GET() {
    try {
        const clients = await clientRepo.getAll();
        return NextResponse.json(clients);
    } catch (error) {
        return NextResponse.json({ error: (error as Error).message }, { status: 500 });
    }
}

export async function POST(request: Request) {
    try {
        const client = await request.json();
        const newClient = await clientRepo.createClient(client);
        return NextResponse.json(newClient, { status: 201 });
    } catch (error) {
        return NextResponse.json({ error: (error as Error).message }, { status: 500 });
    }
}

export async function PUT(request: Request) {
    try {
        const { client_id, updates } = await request.json();
        const updatedClient = await clientRepo.updateClient(client_id, updates);
        return NextResponse.json(updatedClient);
    } catch (error) {
        return NextResponse.json({ error: (error as Error).message }, { status: 500 });
    }
}

export async function DELETE(request: Request) {
    try {
        const { client_id } = await request.json();
        await clientRepo.deleteClient(client_id);
        return NextResponse.json({ message: "Client deleted successfully" });
    } catch (error) {
        return NextResponse.json({ error: (error as Error).message }, { status: 500 });
    }
}
