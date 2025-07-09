FROM mcr.microsoft.com/dotnet/sdk:8.0 AS backend 
WORKDIR /sid
COPY . .
RUN dotnet restore 
RUN dotnet build --configuration Release
RUN dotnet publish -c Release -o ./publish
# RUN cd /sid/publish
# ENTRYPOINT dotnet ElearnBackend.dll

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS siddharth
WORKDIR /dotnet_artifacts
COPY --from=backend /sid/publish .
ENTRYPOINT dotnet ElearnBackend.dll

