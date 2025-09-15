# Use the official .NET 8 SDK image to build the application.
# This stage is named 'build' and will be used to compile and publish the app.
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source

# Copy only the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o /app

# The final stage of the multi-stage build.
# Use the smaller ASP.NET runtime image to run the application, which reduces the final image size.
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app .

# Expose port 8080 for the ASP.NET Core application.
EXPOSE 8080
# The command to run when the container starts.
ENTRYPOINT ["dotnet", "InstanceAPi.dll"]
