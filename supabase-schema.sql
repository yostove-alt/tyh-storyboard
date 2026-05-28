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

insert into storage.buckets (id, name, public)
values ('storyboard-media', 'storyboard-media', true)
on conflict (id) do update set public = true;

drop policy if exists "Anyone can read storyboard media" on storage.objects;
create policy "Anyone can read storyboard media"
on storage.objects
for select
using (bucket_id = 'storyboard-media');

drop policy if exists "Signed in users can upload storyboard media" on storage.objects;
create policy "Signed in users can upload storyboard media"
on storage.objects
for insert
to authenticated
with check (bucket_id = 'storyboard-media');

drop policy if exists "Signed in users can update storyboard media" on storage.objects;
create policy "Signed in users can update storyboard media"
on storage.objects
for update
to authenticated
using (bucket_id = 'storyboard-media')
with check (bucket_id = 'storyboard-media');

drop policy if exists "Signed in users can delete storyboard media" on storage.objects;
create policy "Signed in users can delete storyboard media"
on storage.objects
for delete
to authenticated
using (bucket_id = 'storyboard-media');
