CREATE TABLE "Agents" (
  "agent_id" integer PRIMARY KEY,
  "email" varchar,
  "role" integer,
  "username" varchar,
  "password" varchar,
  "photo" varchar
);

CREATE TABLE "Calls" (
  "call_id" integer PRIMARY KEY,
  "agent_id" integer,
  "creation_date" timestamp
);

CREATE TABLE "Clients" (
  "client_id" integer PRIMARY KEY,
  "email" varchar,
  "client_name" varchar,
  "phone" varchar,
  "industry" varchar,
  "first_contacted" timestamp,
  "description" varchar,
  "agent_id" integer,
  "contract_url" varchar,
  "list_id" integer,
  "status_id" integer
);

CREATE TABLE "Lists" (
  "list_id" integer PRIMARY KEY,
  "header_text" varchar,
  "position" integer,
  "header_color" varchar
);

CREATE TABLE "ClientListHistory" (
  "history_id" integer PRIMARY KEY,
  "client_id" integer,
  "list_id" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Status" (
  "status_id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "Services" (
  "service_id" integer PRIMARY KEY,
  "status_text" varchar,
  "package_id" integer
);

CREATE TABLE "Packages" (
  "package_id" integer PRIMARY KEY,
  "status_text" varchar,
  "contract_id" integer
);

CREATE TABLE "Contracts" (
  "contract_id" integer PRIMARY KEY,
  "status_text" varchar,
  "client_id" integer,
  "agent_id" integer,
  "maintanance_sum" integer,
  "implementation_sum" integer,
  "contract_date" timestamp,
  "implementation_date" timestamp,
  "comision" float
);

CREATE TABLE "Churns" (
  "churn_id" integer PRIMARY KEY,
  "client_id" integer,
  "leave_date" timestamp,
  "leaving_reason" varchar,
  "document" varchar
);

CREATE TABLE "Upsells" (
  "upsell_id" integer PRIMARY KEY,
  "client_id" integer,
  "maintanance_sum" integer,
  "implementation_sum" integer,
  "new_contract_date" timestamp,
  "implementation_date" timestamp,
  "contract_id" integer
);

CREATE TABLE "Appointments" (
  "app_id" integer PRIMARY KEY,
  "agent_id" integer,
  "client_id" integer,
  "status_id" integer,
  "list_id" integer,
  "notes" varchar,
  "scheduled_date" timestamp,
  "remark" varchar
);

CREATE TABLE "AgentStats" (
  "agentstant_id" integer PRIMARY KEY,
  "agent_id" integer,
  "contract_id" integer,
  "total_calls" integer,
  "total_appointments" integer,
  "total_deals" integer
);

CREATE TABLE "Forecasts" (
  "forecast_id" integer PRIMARY KEY,
  "agent_id" integer,
  "period_start" date,
  "period_end" date,
  "projected_deals" integer,
  "projected_commission" float
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
