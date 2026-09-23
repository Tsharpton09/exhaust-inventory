EXHAUST INVENTORY — FRESH SETUP

1. Create a NEW Supabase project.
2. In Supabase, open SQL Editor and run the complete SUPABASE_SETUP.sql file.
3. In Supabase Settings > API Keys, copy:
   - Project URL
   - Publishable key (starts with sb_publishable_)
   NEVER use the secret key in this website.
4. Open index.html in a text editor.
5. Near the bottom, replace:
   PASTE_SUPABASE_URL_HERE
   PASTE_SUPABASE_PUBLISHABLE_KEY_HERE
6. Save index.html.
7. Create a NEW GitHub repository and upload index.html.
8. GitHub repository > Settings > Pages > Deploy from a branch > main > /(root) > Save.
9. Open the GitHub Pages URL.
10. The page should say "Cloud connected".

This version talks directly to Supabase's REST Data API with fetch(). It does not use the Supabase JavaScript SDK or a service worker, which keeps the connection simple and avoids the caching/client issue from the previous build.
