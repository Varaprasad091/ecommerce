FROM node:18-alpine AS build

# Install necessary system dependencies
RUN apk add --no-cache bash

WORKDIR /app

COPY ./Frontend/package.json ./
COPY ./Frontend/package-lock.json ./

# Ensure a clean and proper install
RUN npm ci

COPY ./Frontend ./

# Make react-scripts executable just in case
RUN chmod +x node_modules/.bin/react-scripts

# Now build
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
