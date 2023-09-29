# API-E2E

## About

This project contains and example of API development loop that, in my humble opinion, works well for projects where multiple APIs have to defined and maintained.

This end to end example demonstrates definition of an HTTP API with TypeSpec, production of OpenAPI specification followed with generating client and server size code.

- API surface is specified using TypeSpec.
- TypeSpec produces OpenAPI specification.
- OpenAPI specification is used to generate elements of C# SDK for the API Surface: Contracts, Client.
- OpenAPI specification is also used to generate an API Controller for ASP.NET Core WebAPI.

Resulting binaries are tested on build:
- Test starts Web API server using the built server binary
- Test executes sample commands using direct REST API calls, as well as with the built SDK binary

## Preparing developer environment

### Install .NET

https://learn.microsoft.com/en-us/dotnet/core/install/

### Install TypeSpec

https://microsoft.github.io/typespec/introduction/installation

### NSWag via NPM

https://www.npmjs.com/package/nswag

# Running tests

    pwsh -c ./Tests/start-use-stop.ps1
