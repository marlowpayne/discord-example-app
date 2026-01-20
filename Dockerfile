FROM node:24-alpine AS build
WORKDIR /workspace
COPY package.json package-lock.json ./
RUN npm ci
COPY . ./

FROM node:24-alpine AS production
WORKDIR /workspace
COPY --from=build /workspace ./
EXPOSE 3000
CMD ["npm", "start"]
