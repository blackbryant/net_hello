# ---- Build stage ----
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY src/HelloWorld/HelloWorld.csproj src/HelloWorld/
RUN dotnet restore src/HelloWorld/HelloWorld.csproj
COPY src/ src/
RUN dotnet publish src/HelloWorld/HelloWorld.csproj -c Release -o /app/publish

# ---- Runtime stage (static files served by nginx, non-root, port 8080) ----
FROM nginxinc/nginx-unprivileged:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/publish/wwwroot /usr/share/nginx/html
EXPOSE 8080
