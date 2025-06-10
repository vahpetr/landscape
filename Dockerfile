# Build stage
FROM node:18-slim AS build
WORKDIR /opt/node_app

# install dependencies
COPY package.json yarn.lock* ./
RUN yarn install --frozen-lockfile --network-timeout 600000

# copy source
COPY tsconfig.json ./
COPY public ./public
COPY src ./src

ARG REACT_APP_PROTO_JSON_PATH
ARG REACT_APP_PROTO_JSON_HOST
ARG REACT_APP_GITHUB_API_PRJ_URL
ARG REACT_APP_GITLAB_API_PRJ_URL
ENV NODE_ENV=production
RUN yarn build

# Runtime stage
FROM nginx:1.28.0-alpine-slim
COPY --from=build /opt/node_app/build /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
