# Kebiasaan

Habit tracker. Satu file `index.html` + Supabase (database & login) + Vercel (hosting). Bisa di-install di PC dan Android (PWA).

## 1. Supabase
1. Buat project di supabase.com.
2. SQL Editor → tempel isi `schema.sql` → Run.
3. Authentication → Providers → Email. Matikan "Confirm email" bila ingin langsung masuk setelah daftar.
4. Project Settings → API → salin **Project URL** dan **anon public key**.
5. Buka `index.html`, ganti `SB_URL` dan `SB_KEY` di bagian atas script.

## 2. GitHub
```
git init
git add .
git commit -m "habit tracker"
git branch -M main
git remote add origin https://github.com/USERNAME/habit-tracker.git
git push -u origin main
```

## 3. Vercel
vercel.com → Add New Project → import repo → Framework: **Other** → Deploy. Tanpa build command. Setiap `git push` otomatis deploy ulang.

Setelah deploy, Supabase → Authentication → URL Configuration → isi Site URL dengan domain Vercel.

## 4. Install
- PC (Chrome/Edge): ikon install di address bar.
- Android (Chrome): menu ⋮ → Install app / Add to Home screen.

Anon key aman di frontend karena Row Level Security aktif: tiap akun hanya melihat datanya sendiri.
