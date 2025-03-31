# 1 : construire l' app vuejs 
FROM node:20-alpine AS build-stage 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2 : utiliser Nginx pour servir l'appli 
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# FROM node:20-alpine AS build-stage == version de node et build-stage == car on utilise jusre pour construire le projet 
# WORKDIR /app == définir le répertoire de travail dans le conteneur ou seront copiés les fichiers. ('/app seront le dossier principal où l'appli sera construite)
# COPY package*.json == copie les fichiers dans le conteneur, permet d'installer uniquement les dépendances avant de copier tout le prjoet
# RUN npm install == Installer toutes les dépendances listées dans package.json
# COPY .. copie tout le code sourcve dans le conteneur  
# RUN npm run build gener les fichiers statiques optimisés pour la prod. 

# FROM Nginx:alpine AS production-stage ==
# COPY --from=build-stage /app/dist/usr/share/nginx/html ==
# EXPOSE 80 == 
# CMD ["nginx", "-g", "daemon off;"] ==

