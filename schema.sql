-- Jalankan di Supabase > SQL Editor
create table habits(
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  title text not null, emoji text not null default '✨',
  created_at timestamptz not null default now());
create table logs(
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  habit_id uuid not null references habits on delete cascade,
  day date not null, unique(habit_id, day));
create table notes(
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  day date not null, body text not null default '', primary key(user_id, day));
create table scratch(
  user_id uuid primary key default auth.uid() references auth.users on delete cascade,
  body text not null default '');
alter table habits enable row level security;
alter table logs enable row level security;
alter table notes enable row level security;
alter table scratch enable row level security;
create policy own on habits for all using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy own on logs for all using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy own on notes for all using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy own on scratch for all using (user_id = auth.uid()) with check (user_id = auth.uid());
