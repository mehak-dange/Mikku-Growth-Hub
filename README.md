# Mikku Growth Hub – Version 2

A responsive, installable PWA for daily tasks, study time, DSA, aptitude, academics, internship, English, health, exams and progress history.

## 1. Open in VS Code

1. Extract this folder.
2. Open the folder in VS Code.
3. Install the **Live Server** extension (or use another local static server).
4. Right-click `index.html` → **Open with Live Server**.
5. Use `http://127.0.0.1:5500` or `http://localhost:5500`.

Do not test PWA installation by opening the file directly with `file://`. Service workers require localhost or HTTPS.

## 2. Use locally first

Click **Continue without cloud account**. The app saves data in this browser using localStorage. Try daily tasks, DSA topics, study logs, aptitude and backup/restore before connecting cloud sync.

## 3. Configure Supabase for cross-device sync

1. Create a project at https://supabase.com/.
2. In the project dashboard, open **SQL Editor**.
3. Open `supabase.sql` from this folder, copy all SQL into a new query and run it.
4. In Supabase project settings, find the **Project URL** and the browser-safe **publishable key** (or legacy anon key).
5. Open `config.js` and paste them:

```js
window.APP_CONFIG = {
  SUPABASE_URL: "https://YOUR-PROJECT.supabase.co",
  SUPABASE_ANON_KEY: "YOUR_PUBLISHABLE_OR_ANON_KEY"
};
```

6. Save and refresh the app.
7. Sign up with an email and password. If email confirmation is enabled, confirm the email before signing in.
8. Sign in on your laptop and phone with the same account.

**Security:** Never put a Supabase `service_role` or secret key in `config.js` or any browser code. The SQL enables row-level security so each signed-in user can access only their own row.

## 4. Install on Android

1. Deploy the folder to an HTTPS host (Vercel, Netlify, or GitHub Pages).
2. Open the deployed URL in Chrome on Android.
3. Sign in to the same account used on your laptop.
4. Use Chrome's **Install app** prompt or menu → **Install app / Add to Home screen**.

On desktop Chrome/Edge, use the install icon in the address bar or the app's Install button.

## 5. Backup

Go to **Backup & settings → Download backup**. This downloads a JSON file containing your app data. Keep a copy in a safe place. Use Restore backup to import it later.

## 6. Important behaviour and limitations

- Daily completion is calculated from that date's completed tasks divided by that date's total tasks.
- Weekly completion is the combined completed/total task ratio for the current Monday–Sunday week.
- Study hours are calculated from study-time entries.
- Historical data is stored by date and shown in the History tab.
- Local mode is device/browser-specific.
- Cloud sync requires internet and Supabase configuration. Offline edits remain in local storage until you sync.
- For the first version, use one device at a time while editing, then allow it to sync before switching devices. This avoids simultaneous-edit conflicts.
- The app is a planner, not a medical tool. Follow your clinician's advice for health routines.

## Project files

- `index.html` – app structure
- `styles.css` – responsive design
- `app.js` – application logic and progress calculations
- `config.js` – Supabase public project configuration
- `supabase.sql` – database table and row-level security
- `manifest.webmanifest` – PWA metadata
- `sw.js` – offline app shell cache
- `icon.svg` – app icon
