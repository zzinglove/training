create table if not exists public.lunch_history (
  id uuid primary key default gen_random_uuid(),
  user_id text not null,
  menu_name text not null,
  category text not null,
  eaten_on date not null,
  created_at timestamptz not null default now()
);

alter table public.lunch_history enable row level security;

create policy "public lunch history read"
  on public.lunch_history for select using (true);

create policy "public lunch history insert"
  on public.lunch_history for insert with check (true);
