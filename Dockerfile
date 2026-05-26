FROM nginx:alpine

# Replace default config with ours (SPA-style fallback to index.html)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Root page + assets
COPY index.html /usr/share/nginx/html/index.html
COPY landgrant-horizontal.png /usr/share/nginx/html/
COPY parking.png /usr/share/nginx/html/
COPY parking2.png /usr/share/nginx/html/
COPY trivia.png /usr/share/nginx/html/
COPY musictrivia.jpg /usr/share/nginx/html/

# Strawberry Jam page (and its assets, kept at root for shared use)
COPY strawberry-jam/ /usr/share/nginx/html/strawberry-jam/
COPY jsj-info/ /usr/share/nginx/html/jsj-info/
COPY JSJ-2026-Map-Horz.png /usr/share/nginx/html/
COPY LG-JSJ-2026-Social-Lineups-Info-parking.png /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
