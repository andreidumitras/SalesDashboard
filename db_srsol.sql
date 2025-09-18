CREATE TABLE "Agents" (
  "agent_id" integer PRIMARY KEY,
  "email" varchar NOT NULL,
  "role" integer NOT NULL,
  "username" varchar NOT NULL,
  "password" varchar NOT NULL,
  "photo" varchar NOT NULL
);

CREATE TABLE "Calls" (
  "call_id" integer PRIMARY KEY,
  "agent_id" integer NOT NULL,
  "creation_date" timestamp NOT NULL
);

CREATE TABLE "Clients" (
  "client_id" integer PRIMARY KEY,
  "email" varchar NOT NULL,
  "client_name" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "industry" varchar NOT NULL,
  "first_contacted" timestamp NOT NULL,
  "description" varchar NOT NULL,
  "agent_id" integer NOT NULL,
  "contract_url" varchar NOT NULL,
  "list_id" integer NOT NULL,
  "status_id" integer NOT NULL
);

CREATE TABLE "Lists" (
  "list_id" integer PRIMARY KEY,
  "header_text" varchar NOT NULL,
  "position" integer NOT NULL,
  "header_color" varchar NOT NULL
);

CREATE TABLE "ClientListHistory" (
  "history_id" integer PRIMARY KEY,
  "client_id" integer NOT NULL,
  "list_id" integer NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "Status" (
  "status_id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL
);

CREATE TABLE "Services" (
  "service_id" integer PRIMARY KEY,
  "status_text" varchar NOT NULL,
  "package_id" integer NOT NULL
);

CREATE TABLE "Packages" (
  "package_id" integer PRIMARY KEY,
  "status_text" varchar NOT NULL,
  "contract_id" integer NOT NULL
);

CREATE TABLE "Contracts" (
  "contract_id" integer PRIMARY KEY,
  "status_text" varchar NOT NULL,
  "client_id" integer NOT NULL,
  "agent_id" integer NOT NULL,
  "maintanance_sum" integer NOT NULL,
  "implementation_sum" integer NOT NULL,
  "contract_date" timestamp NOT NULL,
  "implementation_date" timestamp NOT NULL,
  "comision" float NOT NULL
);

CREATE TABLE "Churns" (
  "churn_id" integer PRIMARY KEY,
  "client_id" integer NOT NULL,
  "leave_date" timestamp NOT NULL,
  "leaving_reason" varchar NOT NULL,
  "document" varchar NOT NULL
);

CREATE TABLE "Upsells" (
  "upsell_id" integer PRIMARY KEY,
  "client_id" integer NOT NULL,
  "maintanance_sum" integer NOT NULL,
  "implementation_sum" integer NOT NULL,
  "new_contract_date" timestamp NOT NULL,
  "implementation_date" timestamp NOT NULL,
  "contract_id" integer NOT NULL
);

CREATE TABLE "Appointments" (
  "app_id" integer PRIMARY KEY,
  "agent_id" integer NOT NULL,
  "client_id" integer NOT NULL,
  "status_id" integer NOT NULL,
  "list_id" integer NOT NULL,
  "notes" varchar NOT NULL,
  "scheduled_date" timestamp NOT NULL,
  "remark" varchar NOT NULL
);

CREATE TABLE "AgentStats" (
  "agentstant_id" integer PRIMARY KEY,
  "agent_id" integer NOT NULL,
  "contract_id" integer NOT NULL,
  "total_calls" integer NOT NULL,
  "total_appointments" integer NOT NULL,
  "total_deals" integer NOT NULL
);

CREATE TABLE "Forecasts" (
  "forecast_id" integer PRIMARY KEY,
  "agent_id" integer NOT NULL,
  "period_start" date NOT NULL,
  "period_end" date NOT NULL,
  "projected_deals" integer NOT NULL,
  "projected_commission" float NOT NULL
);

ALTER TABLE "Calls" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "Clients" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "Services" ADD FOREIGN KEY ("package_id") REFERENCES "Packages" ("package_id");

ALTER TABLE "Packages" ADD FOREIGN KEY ("contract_id") REFERENCES "Contracts" ("contract_id");

ALTER TABLE "Contracts" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");

ALTER TABLE "Contracts" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "Clients" ADD FOREIGN KEY ("list_id") REFERENCES "Lists" ("list_id");

ALTER TABLE "Clients" ADD FOREIGN KEY ("status_id") REFERENCES "Status" ("status_id");

ALTER TABLE "Appointments" ADD FOREIGN KEY ("list_id") REFERENCES "Lists" ("list_id");

ALTER TABLE "Appointments" ADD FOREIGN KEY ("status_id") REFERENCES "Status" ("status_id");

ALTER TABLE "Churns" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");

ALTER TABLE "Upsells" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");

ALTER TABLE "AgentStats" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "Appointments" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "Appointments" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");

ALTER TABLE "Forecasts" ADD FOREIGN KEY ("agent_id") REFERENCES "Agents" ("agent_id");

ALTER TABLE "AgentStats" ADD FOREIGN KEY ("contract_id") REFERENCES "Contracts" ("contract_id");

ALTER TABLE "ClientListHistory" ADD FOREIGN KEY ("list_id") REFERENCES "Lists" ("list_id");

ALTER TABLE "ClientListHistory" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");

ALTER TABLE "Upsells" ADD FOREIGN KEY ("contract_id") REFERENCES "Contracts" ("contract_id");
