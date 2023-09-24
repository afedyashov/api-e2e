# api-e2e
End to end example of defining an HTTP API with TypeSpec, with generated code on client and server side

- API surface is specified using TypeSpec.
- TypeSpec produces OpenAPI specification.
- OpenAPI specification is used to generate elements of C# SDK for the API Surface: Contracts, Client.
- OpenAPI specification is also used to generate an API Controller for ASP.NET Core WebAPI.

Resulting binaries are tested:
- We start the Web API server using the built server binary
- Execute sample commands using the built SDK binary

# Preparing developer environment

## Install .NET

https://learn.microsoft.com/en-us/dotnet/core/install/

## Install TypeSpec

https://microsoft.github.io/typespec/introduction/installation

## NSWag via NPM

https://www.npmjs.com/package/nswag

# Running tests

    pwsh -c ./Tests/start-use-stop.ps1

# Troubleshooting

## First Run

deff@Andriys-Mini api-e2e % dotnet run --project ./ApiServer/ApiServer.csproj
warn: Microsoft.AspNetCore.Server.Kestrel.Core.KestrelServer[5]
      The application is trying to access the ASP.NET Core developer certificate key. A prompt might appear to ask for permission to access the key. When that happens, select 'Always Allow' to grant 'dotnet' access to the certificate key in the future.

dotnet run --project ./ApiServer/ApiServer.csproj --urls=http://localhost:5000

# PowerShell Cmdlet authoring

https://stackoverflow.com/questions/39904813/can-i-write-powershell-binary-cmdlet-with-net-core