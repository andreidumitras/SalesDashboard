export interface Agent {
  agent_id: number;
  email: string;
  role: number;
  username: string;
  password?: string | null;
  photo?: string | null;
}

export interface Call {
  call_id: number;
  agent_id?: number | null;
  creation_date?: string | null;
}

export interface Client {
  client_id: number;
  email?: string | null;
  client_name: string;
  phone?: string | null;
  industry?: string | null;
  first_contacted?: string | null;
  description?: string | null;
  agent_id?: number | null;
  contract_url?: string | null;
  list_id?: number | null;
  status_id?: number | null;
}

export interface List {
  list_id: number;
  header_text?: string | null;
  position?: number | null;
  header_color?: string | null;
}

export interface ClientListHistory {
  history_id: number;
  client_id?: number | null;
  list_id?: number | null;
  created_at?: string | null;
  updated_at?: string | null;
}

export interface Status {
  status_id: number;
  name?: string | null;
  description?: string | null;
}

export interface Service {
  service_id: number;
  status_id?: number | null;
  package_id?: number | null;
}

export interface Package {
  package_id: number;
  status_id?: number | null;
  contract_id?: number | null;
}

export interface Contract {
  contract_id: number;
  status_id?: number | null;
  client_id?: number | null;
  agent_id?: number | null;
  maintanance_sum?: number | null;
  implementation_sum?: number | null;
  contract_date?: string | null;
  implementation_date?: string | null;
  comision?: number | null;
}

export interface Churn {
  churn_id: number;
  client_id?: number | null;
  leave_date?: string | null;
  leaving_reason?: string | null;
  document?: string | null;
}

export interface Upsell {
  upsell_id: number;
  client_id?: number | null;
  maintanance_sum?: number | null;
  implementation_sum?: number | null;
  new_contract_date?: string | null;
  implementation_date?: string | null;
  contract_id?: number | null;
}

export interface Appointment {
  app_id: number;
  agent_id?: number | null;
  client_id?: number | null;
  status_id?: number | null;
  list_id?: number | null;
  notes?: string | null;
  scheduled_date?: string | null;
  remark?: string | null;
}

export interface AgentStats {
  agentstant_id: number;
  agent_id?: number | null;
  contract_id?: number | null;
  total_calls?: number | null;
  total_appointments?: number | null;
  total_deals?: number | null;
}

export interface Forecast {
  forecast_id: number;
  agent_id?: number | null;
  period_start?: string | null;
  period_end?: string | null;
  projected_deals?: number | null;
  projected_commission?: number | null;
}
