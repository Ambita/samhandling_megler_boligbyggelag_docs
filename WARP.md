---
title: "WARP Development Guide"
layout: default
exclude: true
---

# WARP.md

Guidance for WARP (warp.dev) when working with this repository.

## Repository Overview

API documentation and type definitions for broker-accountant cooperation in Norwegian real estate. Handles property sales workflow for cooperative housing (borettslag), including preemption rights (forkjøpsrett), board approval (styregodkjenning), and ownership transfers.

## Repository Structure

```
.
├── README.md                    # Main documentation
├── requestTypes.ts              # Request message interfaces
├── callbackTypes.ts             # Response/callback interfaces
├── docs/                        # Per-message-type documentation
│   ├── boliginformasjon.md      # Property information
│   ├── forhandsutlysing.md      # Preemption rights clarification
│   ├── salgsmelding.md          # Sales notifications/transfers
│   ├── endring-overdragelsesdato.md # Transfer date changes
│   ├── endring-kjopere.md       # Buyer changes
│   ├── sluttbrev.md             # Final completion
│   ├── restanse.md              # Arrears handling
│   └── feilmeldinger.md         # Error messages
├── images/                      # Flowchart diagrams
└── typespec/                    # TypeSpec definitions
    ├── main.tsp                 # Schema definitions
    ├── generated/               # Client libraries (TS, Java, C#)
    └── tsp-output/              # OpenAPI 3.0 + JSON Schema
```

## Development Commands

### TypeScript
```bash
# Validate syntax (standalone, no build needed)
tsc --noEmit requestTypes.ts callbackTypes.ts
```

### TypeSpec
```bash
cd typespec/
npm install              # Install dependencies
npx tsp compile .        # Compile to OpenAPI 3.0 + JSON Schema
```
Output: `tsp-output/@typespec/openapi3/openapi.yaml` and `tsp-output/@typespec/json-schema/*.yaml`

**Status**: ✅ TypeSpec compilation working (enum issues resolved, all endpoints implemented)

## Architecture Overview

### Core Operations
1. **Clarification (Forhåndsutlysing)**: Pre-sale preemption rights (3 months validity)
2. **Ownership Change (Salgsmelding)**: Property sale/transfer with board approval
3. **Arrears (Restanse)**: Outstanding debts (under development)

## Message Flow

Asynchronous POST-based: Broker → Ambita → Accountant → Ambita → Broker (PDF + data)

**Request Types**: `boliginformasjon`, `forhandsutlysing`, `salgsmelding`, `endringoverdragelse`, `endringkjopere`, `sluttbrev`

**Response Suffixes**: `mottatt` (ack), `oppdatering` (update), `fullfort` (complete), `utlopt` (expired), `feil` (error)

## TypeScript vs TypeSpec

**Dual definitions** maintained:
- **TypeScript** (`*.ts`): Primary source of truth, edit first
- **TypeSpec** (`main.tsp`): Generates OpenAPI 3.0, update after TypeScript

**Change Workflow**:
1. Update TypeScript interfaces (`requestTypes.ts`, `callbackTypes.ts`)
2. Mirror in TypeSpec (`typespec/main.tsp`)
3. Test: `cd typespec && npx tsp compile .`
4. Commit both together

## Code Generation

TypeSpec generates OpenAPI 3.0 specs and client libraries (TypeScript, Java, C#) via OpenAPI Generator CLI v2.23.1.

### Client Libraries
- **TypeScript**: `typespec/generated/typescript/` → `@samhandling/client`
- **Java**: `typespec/generated/java/` → `no.samhandling:samhandling-client` (Maven/Gradle)
- **C#**: `typespec/generated/csharp/` → `Samhandling.Client` (.NET 8.0)

### Commands
```bash
cd typespec/
npm install              # Install dependencies
npm run build            # Generate TypeSpec + all clients
npm run clean            # Remove generated files
npm run postcompile:tsp  # Regenerate clients only
```

**Config**: `scripts/{typescript,java,csharp}-config.json` (naming, packages, options)

## Common Development Tasks

### Adding New Message Type
1. Define in `requestTypes.ts` and `callbackTypes.ts`
2. Add to `CallbackEvent` union type
3. Update `typespec/main.tsp`
4. Create `docs/[message-type].md` with examples
5. Update `README.md` TOC
6. Add flow diagram to `images/` if needed

### Updating Messages
1. Modify TypeScript interfaces
2. Update TypeSpec models
3. Verify backward compatibility
4. Update `docs/[message-type].md`
5. Test TypeSpec compilation

### PDF Fonts
Use **Inter** (body) and **PT Serif** (headings)

## Message Examples

See `docs/` for detailed JSON examples:
- `boliginformasjon.md`, `forhandsutlysing.md`, `salgsmelding.md`, `endring-overdragelsesdato.md`, `endring-kjopere.md`, `sluttbrev.md`, `restanse.md`, `feilmeldinger.md`

## Guidelines

- Maintain TypeScript/TypeSpec consistency
- Preserve backward compatibility
- Use Norwegian field names (kjopesum, salgsmelding, etc.)
- Document complex flows with diagrams
- Include examples for new message types
- Test TypeSpec compilation before committing

## Troubleshooting

**TypeSpec issues**:
1. `cd typespec && npm install`
2. `npx tsp compile .`
3. Verify `tsp-output/@typespec/openapi3/openapi.yaml` exists
4. Always update TypeScript first, then TypeSpec
