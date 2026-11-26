-- Run this entire script in Supabase: SQL Editor -> New query -> Run.
create table if not exists public.user_planner_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_planner_data enable row level security;

drop policy if exists "Users can read their own planner data" on public.user_planner_data;
create policy "Users can read their own planner data"
on public.user_planner_data for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own planner data" on public.user_planner_data;
create policy "Users can insert their own planner data"
on public.user_planner_data for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own planner data" on public.user_planner_data;
create policy "Users can update their own planner data"
on public.user_planner_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- No service-role key is required by the browser app.
