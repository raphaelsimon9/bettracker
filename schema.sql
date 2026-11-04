-- Run once in Supabase → SQL Editor
create table public.bets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  platform text not null,
  stake numeric(14,2) not null check (stake >= 0),
  odds numeric(10,2) not null check (odds >= 1),
  bet_date date not null,
  status text not null default 'pending' check (status in ('pending','won','lost')),
  settled_date date,
  created_at timestamptz not null default now()
);
create table public.deposits (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  amount numeric(14,2) not null check (amount >= 0),
  deposit_date date not null,
  platform text not null,
  bank text not null,
  created_at timestamptz not null default now()
);
alter table public.bets enable row level security;
alter table public.deposits enable row level security;
create policy "own bets" on public.bets for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own deposits" on public.deposits for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
