# landgrantbrewing.com

Static site for Land-Grant Brewing, served via Coolify + Docker.

## Pages

- `/` — temporary landing page (taproom hours, weekly schedule, events, parking, reservations) shown while the main site is down. Source: `index.html`.
- `/strawberry-jam` — Strawberry Jam 2026 festival page. Source: `strawberry-jam/index.html`.
- `/jsj-info` — same Strawberry Jam page, kept for any existing shared links.

The nginx config rewrites any unknown path to the root landing page (e.g. `/events`, `/reservations` → landing), while real subdirectories like `/strawberry-jam` continue to serve their own `index.html`.

## Assets at the repo root

| File | Used by |
|------|---------|
| `landgrant-horizontal.png` | Landing page header |
| `parking.png`, `parking2.png` | Landing page parking section |
| `trivia.png`, `musictrivia.jpg` | Landing page Tue/Thu callouts |
| `JSJ-2026-Map-Horz.png`, `LG-JSJ-2026-Social-Lineups-Info-parking.png` | Strawberry Jam pages (referenced with absolute `/` paths) |

## Deploy (Coolify)

Coolify should detect the `Dockerfile` and use the Dockerfile build pack.

- **Build pack:** Dockerfile
- **Port:** 80
- **Domain:** landgrantbrewing.com

To deploy a change, push to `main`. Coolify will rebuild automatically if auto-deploy is on; otherwise hit "Redeploy" in the Coolify UI.

## Local preview

Open `index.html` directly in a browser, or build the container:

```bash
docker build -t lg-site .
docker run --rm -p 8080:80 lg-site
# visit http://localhost:8080
```
