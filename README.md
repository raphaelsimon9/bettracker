# Bet Tracker

Static web app (no build step) + Supabase for login and sync. Installable on phone and laptop.

## 1. Supabase (free)
1. Create a project at supabase.com.
2. SQL Editor → paste `schema.sql` → Run. This creates `bets` and `deposits` with row-level security, so each login only sees its own rows.
3. Project Settings → API → copy the **Project URL** and the **anon public** key into `config.js`.
   (The anon key is safe in the browser; RLS protects the data. Never use the service_role key.)
4. Optional, for personal use: Authentication → Providers → Email → turn off "Confirm email" so sign-up logs you straight in.

## 2. Deploy on Vercel
- Easiest: push this folder to a GitHub repo → vercel.com → Add New Project → import it → Framework "Other" → Deploy.
- Or CLI: `npm i -g vercel` then run `vercel --prod` in this folder.
Then in Supabase → Authentication → URL Configuration, set Site URL to your Vercel address.

## 3. Install
- Android (Chrome): menu → Install app.
- iPhone (Safari): Share → Add to Home Screen.
- Laptop (Chrome/Edge): install icon in the address bar.

When you change files, bump `C` in `sw.js` (e.g. `bet-tracker-v2`) so devices pick up the update.
