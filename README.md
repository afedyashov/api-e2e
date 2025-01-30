# API-E2E

## About

This project contains an example of API development loop that, in my humble opinion, works well for projects where multiple APIs have to be defined and maintained.

This end to end example demonstrates definition of an HTTP API with TypeSpec, production of OpenAPI specification followed by generating client and server size code, exposing resulting client SDK as PowerShell cmdlet for convenient scripting of API testing scenarios. 

```mermaid
---
title: Flow Diagram
---
flowchart
    TypeSpec[API specification] ---|tsp| OpenAPI
    OpenAPI ---|nswag| SDK
    SDK[ApiClient<br>ApiContracts<br>ApiServer]
```

The flow:
- API surface is specified using TypeSpec.
- TypeSpec produces OpenAPI specification.
- OpenAPI specification is used to generate elements of C# SDK for the API Surface: Contracts, Client.
- OpenAPI specification is also used to generate an API Controller for ASP.NET Core WebAPI.
- All resulting binaries are tested on CI build, shifting as much left as possible:
    - Test starts Web API server using the built server binary
    - Test executes sample commands:
        - using direct REST API calls
        - using the generated client SDK wrapped in a PowerShell cmdlet for scripting convenience

## Preparing developer environment

### Install .NET

https://learn.microsoft.com/en-us/dotnet/core/install/

### Install TypeSpec

https://microsoft.github.io/typespec/introduction/installation

### NSWag via NPM

https://www.npmjs.com/package/nswag

# Running tests

```mermaid
---
title: Test Sequence
---
sequenceDiagram
    participant TestPwsh as Test PowerShell Interpreter
    participant WebServer as Web Server
    participant TestCmdlet as Test Cmdlet
    
    TestPwsh->>TestPwsh: Start the API server (dotnet run)
    TestPwsh->>WebServer: API server starts in background (&)
    TestPwsh->>TestPwsh: Wait for API server to initialize (15s)

    TestPwsh->>WebServer: Invoke-RestMethod (GET /operations/sayhello)
    WebServer-->>TestPwsh: Returns response
    
    TestPwsh->>TestCmdlet: Import-Module ApiCmdlet.dll
    TestPwsh->>TestCmdlet: Invoke-SayHello -BaseUrl http://localhost:5000/
    TestCmdlet->>WebServer: Calls API (/operations/sayhello)
    WebServer-->>TestCmdlet: Returns response
    TestCmdlet-->>TestPwsh: Returns response
    
    TestPwsh->>TestPwsh: Stop API server job
```

Instructions:

    dotnet build ./ApiCmdlet/
    pwsh -c ./ApiTest/start-use-stop.ps1
