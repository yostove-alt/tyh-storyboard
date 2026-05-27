create table if not exists public.storyboard_snapshots (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.storyboard_snapshots enable row level security;

drop policy if exists "Anyone can read storyboard snapshots" on public.storyboard_snapshots;
create policy "Anyone can read storyboard snapshots"
on public.storyboard_snapshots
for select
using (true);

drop policy if exists "Signed in users can save storyboard snapshots" on public.storyboard_snapshots;
create policy "Signed in users can save storyboard snapshots"
on public.storyboard_snapshots
for insert
to authenticated
with check (true);

drop policy if exists "Signed in users can update storyboard snapshots" on public.storyboard_snapshots;
create policy "Signed in users can update storyboard snapshots"
on public.storyboard_snapshots
for update
to authenticated
using (true)
with check (true);
