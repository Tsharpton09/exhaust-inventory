-- Exhaust Inventory: fresh Supabase setup
-- Run this entire script in Supabase SQL Editor.

create extension if not exists pgcrypto;

drop table if exists public.inventory;

create table public.inventory (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  part text not null,
  make text not null check (make in ('ford','chevy','ram')),
  order_link text,
  stock integer not null default 0 check (stock >= 0),
  recommended integer not null default 0 check (recommended >= 0),
  created_at timestamptz not null default now()
);

-- Give the Data API roles access to the table.
grant select, insert, update, delete on public.inventory to anon, authenticated;

-- Protect the table with RLS.
alter table public.inventory enable row level security;

create policy "inventory_select_public"
on public.inventory
for select
to anon, authenticated
using (true);

create policy "inventory_insert_public"
on public.inventory
for insert
to anon, authenticated
with check (true);

create policy "inventory_update_public"
on public.inventory
for update
to anon, authenticated
using (true)
with check (true);

create policy "inventory_delete_public"
on public.inventory
for delete
to anon, authenticated
using (true);

-- Optional test row. Uncomment if you want one test item immediately.
-- insert into public.inventory (name, part, make, stock, recommended)
-- values ('Test Exhaust Part', 'TEST-001', 'ford', 5, 3);
