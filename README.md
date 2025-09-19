---
title: Home
layout: default
---

# Ambita Samhandling Forretningsfører

Documentation for cooperation between brokers and accountants

Ambita has designed a set of API messages to capture the flow between a broker and an accountant. We have split the process into separate steps:

1. **Boliginformasjon** (Information about the object). Used to inform the broker about which rules that apply to the sale of a given object.
2. **Forhåndsutlysing** (Advance clarification). If the seller wants to, he or she can clarify any preemption before the object is sold.
3. **Salgsmelding** (Sales message). The broker informs the accountant about the object being sold.
4. **Endring overdragelsesdato** (Change of transfer date). The broker requests a new transfer date
5. **Endring kjøpere** (Change of buyers). The broker requests a change of buyers (new owners)
6. **Sluttbrev** (Final letter). The accountant accepts that the process is completed.
7. **Restanse** (Arrears). The broker requests what payment needs to be fulfilled.
8. **SumGjeld** (Total debt). A standalone request to get the total debt amount for a property.
9. **SumFelleskostnader** (Total common costs). A standalone request to get the total common costs amount for a property.

## End-to-end sequence

The message flow is organised in four stages that align with the product definitions:

1. **Stage 1 – Boliginformasjon:** establish what is possible on the estate.
2. **Stage 2 – Forhåndsutlysing:** optional clarification with up to three callbacks.
3. **Stage 3 – Salgsmelding:** ownership transfer with optional update messages.
4. **Stage 4 – Etterarbeid:** planned completion and arrears workflows.

<div class="mermaid">
sequenceDiagram
    autonumber
    participant Broker as Megler<br/>(Vitec Next)
    participant Ambita as Ambita<br/>Samhandling
    participant Accountant as Forretningsfører

    rect rgb(243,237,247)
        Note over Broker,Accountant: Stage 1 – Boliginformasjon
        Broker->>Ambita: Opprett ordre<br/>Boliginformasjon (type: boliginformasjon)
        Ambita->>Accountant: Videreformidle Boliginformasjon
        Accountant-->>Ambita: Callback boliginformasjon<br/>(forkjøpsrett/styregodkjenning)
        Ambita-->>Broker: Oppdatere prosjektdata<br/>for meglerteamet
    end

    rect rgb(235,242,255)
        Note over Broker,Accountant: Stage 2 – Forhåndsutlysing
        opt Forhåndsutlysing bestilt
            Broker->>Ambita: Send Forhåndsutlysing<br/>(type: forhandsutlysing)
            Ambita->>Accountant: Videreformidle Forhåndsutlysing
            loop Inntil tre forhandsutlysing-callbacker
                Accountant-->>Ambita: Callback forhandsutlysingtidlig/utsatt/sen
                Ambita-->>Broker: Vise forkjøpsstatus<br/>i meglerløsningen
            end
            opt Forkjøpsrett utløpt
                Accountant-->>Ambita: Callback forhandsutlysingutlopt
                Ambita-->>Broker: Signalisere utløpt forkjøpsrett
            end
        end
    end

    rect rgb(240,255,248)
        Note over Broker,Accountant: Stage 3 – Salgsmelding og endringer
        Broker->>Ambita: Send Salgsmelding<br/>(type: salgsmelding)
        Ambita->>Accountant: Videreformidle Salgsmelding
        Accountant-->>Ambita: Callback salgsmeldingmottatt
        Ambita-->>Broker: Synk mottakskvittering

        loop Oppdateringer til ferdigstillelse
            Accountant-->>Ambita: Callback salgsmeldingoppdatering
            Ambita-->>Broker: Oppdatere styregodkjenning<br/>og forkjøpsstatus
        end
        Accountant-->>Ambita: Callback salgsmeldingfullfort
        Ambita-->>Broker: Markere salgsmelding som fullført

        opt Endring overdragelsesdato
            Broker->>Ambita: Send Endring overdragelsesdato<br/>(type: endringoverdragelse)
            Ambita->>Accountant: Videreformidle datoendring
            Accountant-->>Ambita: Callback endringoverdragelse
            Ambita-->>Broker: Bekrefte ny overdragelsesdato
        end

        opt Endring kjøpere
            Broker->>Ambita: Send Endring kjøpere<br/>(type: endringkjopere)
            Ambita->>Accountant: Videreformidle kjøperendring
            Accountant-->>Ambita: Callback endringkjoperemottatt
            Ambita-->>Broker: Informere om ny styregodkjenning
            Accountant-->>Ambita: Callback endringkjoperefullfort
            Ambita-->>Broker: Bekrefte ferdigstilt kjøperendring
        end

    end

    rect rgb(255,247,235)
        Note over Broker,Accountant: Stage 4 – Etterarbeid (planlagt)
        opt Sluttbrev
            Broker->>Ambita: Send Sluttbrev<br/>(type: sluttbrev)
            Ambita->>Accountant: Videreformidle Sluttbrev
            Accountant-->>Ambita: Callback sluttbrevakseptert
            Ambita-->>Broker: Bekrefte avsluttet prosess
        end

        opt Restanse
            Broker->>Ambita: Bestill Restanse<br/>(type: restanse)
            Ambita->>Accountant: Etterspør restanseoversikt
            Accountant-->>Ambita: Levere restanseoversikt
            Ambita-->>Broker: Presentere utestående kostnader
        end
    end

    Note over Broker,Accountant: Kan gjentas parallelt med øvrige steg
    opt Finansielle forespørsler
        Broker->>Ambita: Bestill SumGjeld/SumFelleskostnader
        Ambita->>Accountant: Videreformidle finansforespørsel
        Accountant-->>Ambita: Callback sumgjeld/sumfelleskostnader
        Ambita-->>Broker: Oppdatere økonomioversikt
    end
    Note over Broker,Accountant: SumGjeld og SumFelleskostnader kan bestilles når som helst
</div>

## Documentation

### Message Types

#### Main Process Flow Messages
* **[Boliginformasjon](docs/boliginformasjon.md)** - Property information requests
* **[Forhåndsutlysing](docs/forhandsutlysing.md)** - Advance clarification of preemption rights
* **[Salgsmelding](docs/salgsmelding.md)** - Sales notifications and ownership transfers
* **[Endring overdragelsesdato](docs/endring-overdragelsesdato.md)** - Transfer date changes
* **[Endring kjøpere](docs/endring-kjopere.md)** - Buyer changes
* **[Sluttbrev](docs/sluttbrev.md)** - Final completion letters
* **[Restanse](docs/restanse.md)** - Arrears handling

#### Standalone Information Messages
* **[SumGjeld](docs/sumgjeld.md)** - Total debt requests
* **[SumFelleskostnader](docs/sumfelleskostnader.md)** - Total common costs requests

#### System Messages
* **[Feilmeldinger](docs/feilmeldinger.md)** - Error messages

### Type Definitions

The message format and process is described in more detail per product. You may take a look at the typescript types for the messages here:

* [Request types](requestTypes.ts)
* [Response types](callbackTypes.ts)

### Standalone Information Messages

In addition to the main process flow messages, there are two standalone message types that can be ordered independently at any time:

* **SumGjeld** and **SumFelleskostnader** are simplified alternatives to Boliginformasjon when you only need specific financial information
* These messages do not interfere with other product messages and can be used alongside the main process flow
* They share the same basic structure as Boliginformasjon but are much simpler, containing only the essential request fields and returning a single numerical value

## General information about the message flow

Each flow starts with an order from a broker using the Vitec Next platform. This order will trigger a request from our system to the accountant's backend. The accountant will send one or more response messages back to us, and we will transform these into a series of operations on Vitec Next. The first version of the system relies heavily on PDF files that we deliver into the project archive. These files will gradually be replaced with API calls that push the structured data into the broker system. This will be done with little or no effect on the accountant integrations.

The messages are sent as JSON objects over HTTPS, as POST requests to the accountant. Responses are sent back to us as POST requests. In other words, the communication is asynchronous.

## Comments on message flow

The following descriptions define a set of flows between us and the accountant system. The messages are described in a way that assumes that the process is fully automated and that the accountant can handle operations themselves. Sometimes part of the flow is handled outside the accountant system. In these cases, we will inform the broker about this. The broker will then have to handle the operation manually.

To explain this in more detail the process can be viewed as three separate large operations: 

 * **Clarification**
 * **Ownership change**
 * **Arrears**

All messages interact with these three operations. Special handling is required if the accountant system is not used to handle any one of these.

## TypeSpec Schema and Client Generation

This repository includes a [TypeSpec](https://typespec.io/) schema that provides an alternative way to work with the API definitions. TypeSpec compiles to OpenAPI 3.0 specifications and enables automatic generation of client libraries in multiple programming languages.

### Schema Definitions

The API is defined in two formats:

- **TypeScript interfaces** (`requestTypes.ts`, `callbackTypes.ts`) - Primary source of truth
- **TypeSpec schema** (`typespec/main.tsp`) - Alternative definition that generates OpenAPI specs

### Generated Client Libraries

From the TypeSpec schema, we automatically generate production-ready client libraries for:

#### TypeScript/JavaScript Client
- **Package**: `@samhandling/client`
- **Location**: `typespec/generated/typescript/`
- **Features**: Full TypeScript types, fetch-based HTTP client, ES6+ support
- **Build files**: `package.json`, `tsconfig.json`

#### Java Client
- **Package**: `no.samhandling:samhandling-client`
- **Location**: `typespec/generated/java/`
- **Features**: Maven/Gradle compatible, Java 8+ support, native HTTP client
- **Build files**: `pom.xml`, `build.gradle`, complete project structure

#### C# (.NET) Client
- **Package**: `Samhandling.Client`
- **Location**: `typespec/generated/csharp/`
- **Features**: .NET 8.0 compatible, async/await support, nullable reference types
- **Build files**: `.csproj`, `.sln`, NuGet package ready

### Getting Started with Client Generation

#### Prerequisites
```bash
cd typespec/
npm install
```

#### Generate All Clients
```bash
cd typespec/
npm run build
```

This command:
1. Compiles TypeSpec to OpenAPI 3.0 specification
2. Generates JSON Schema definitions
3. Creates client libraries for TypeScript, Java, and C#

#### Clean Build Environment
```bash
cd typespec/
npm run clean
```

### Using the Generated Clients

Each generated client includes:
- Complete API client with all endpoints
- Type definitions for all request/response models
- Configuration options for base URL, authentication, etc.
- Documentation and README files
- Unit test templates
- Build configuration for the target platform

### Development Workflow

1. **Update API definitions**: Edit TypeScript interfaces first (`requestTypes.ts`, `callbackTypes.ts`)
2. **Mirror changes in TypeSpec**: Update `typespec/main.tsp` to match
3. **Generate clients**: Run `npm run build` in the `typespec/` directory
4. **Use clients**: Import and use the generated libraries in your projects

### Configuration

Client generation is configured through:
- **TypeScript**: `typespec/scripts/typescript-config.json`
- **Java**: `typespec/scripts/java-config.json`
- **C#**: `typespec/scripts/csharp-config.json`

These files control naming conventions, package details, and framework-specific options.

### Build Tools

The client generation uses:
- **TypeSpec Compiler** v1.3.0 for schema compilation
- **OpenAPI Generator CLI** v2.23.1 for client generation
- Versions are pinned in `package.json` for reproducible builds

For more detailed information about the TypeSpec setup and development workflow, see [WARP.md](WARP.md).
