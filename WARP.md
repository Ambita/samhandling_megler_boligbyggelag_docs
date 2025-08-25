# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This repository contains API documentation and type definitions for cooperation between brokers (meglere) and accountants (boligbyggelag) in the Norwegian real estate market. The system is designed to handle the complex workflow of property sales involving cooperative housing (borettslag), including preemption rights (forkjøpsrett), board approval (styregodkjenning), and ownership transfers.

## Repository Structure

```
.
├── README.md                    # Main documentation with general info and table of contents
├── requestTypes.ts              # TypeScript interfaces for request messages  
├── callbackTypes.ts             # TypeScript interfaces for response/callback messages
├── docs/                        # Detailed documentation for each message type
│   ├── boliginformasjon.md      # Property information requests
│   ├── forhandsutlysing.md      # Advance clarification of preemption rights
│   ├── salgsmelding.md          # Sales notifications and ownership transfers
│   ├── endring-overdragelsesdato.md # Transfer date changes
│   ├── endring-kjopere.md       # Buyer changes
│   ├── sluttbrev.md             # Final completion letters
│   ├── restanse.md              # Arrears handling
│   └── feilmeldinger.md         # Error messages
├── images/                      # Flowchart diagrams (.png and .graphml files)
│   ├── Information.png          # Boliginformasjon flow
│   ├── Clarification.png        # Forhåndsutlysing flow  
│   ├── Salesmessage.png         # Salgsmelding flow
│   └── Changetransferdate.png   # Endring overdragelsesdato flow
└── typespec/                    # TypeSpec definitions (alternative to TypeScript)
    ├── main.tsp                 # Complete TypeSpec schema definitions
    ├── package.json             # TypeSpec tooling dependencies
    ├── tspconfig.yaml           # TypeSpec compiler configuration
    └── node_modules/            # TypeSpec dependencies
```

## Development Commands

### TypeScript Development
```bash
# The TypeScript files are standalone - no build process needed
# They serve as documentation and type definitions for TypeScript consumers

# To validate TypeScript syntax (if you have tsc installed):
tsc --noEmit requestTypes.ts
tsc --noEmit callbackTypes.ts
```

### TypeSpec Development  
```bash
# Navigate to typespec directory
cd typespec/

# Install dependencies
npm install

# Compile TypeSpec to OpenAPI 3.0 (now working!)
npx tsp compile .

# Output goes to tsp-output/ directory
# Generated files: tsp-output/@typespec/openapi3/openapi.yaml
```

**Status**: ✅ **TypeSpec compilation now works successfully!** 

The previous enum schema issues have been resolved by:
- Converting `alias` literal unions to proper `enum` definitions
- Adding proper TypeScript-compatible scalar types for dates
- Implementing all missing request and response models
- Fixing field type mismatches between TypeScript and TypeSpec
- Adding all missing API endpoints: `/sluttbrev`, `/sumgjeld`, `/sumfelleskostnader`

## Architecture Overview

The system handles three core operations:

### 1. **Clarification (Forhåndsutlysing)**
- **Purpose**: Pre-sale clarification of preemption rights
- **Trigger**: Seller wants to clarify preemption before sale
- **Flow**: Request → Early response → (Optional delay) → Final response
- **Duration**: Usually 3 months validity

### 2. **Ownership Change (Eierskifte/Salgsmelding)**  
- **Purpose**: Process actual property sale and ownership transfer
- **Trigger**: Property has been sold
- **Flow**: Request → Received → (Optional updates) → Completed
- **Includes**: Board approval process, buyer verification

### 3. **Arrears (Restanse)**
- **Purpose**: Handle outstanding debts and payments
- **Status**: Not yet fully designed/implemented

## Message Flow Pattern

All communication follows an asynchronous POST-based pattern:

```mermaid
sequenceDiagram
    participant Broker as Broker System
    participant Ambita as Ambita Platform  
    participant Accountant as Accountant System
    
    Broker->>Ambita: Request (boliginformasjon, salgsmelding, etc.)
    Ambita->>Accountant: Forward Request
    Accountant->>Ambita: Response/Callback
    Ambita->>Broker: Process & Deliver (PDF + structured data)
```

### Request Types
- `boliginformasjon` - Property information request
- `forhandsutlysing` - Preemption clarification request  
- `salgsmelding` - Sales notification
- `endringoverdragelse` - Transfer date change
- `endringkjopere` - Buyer change
- `sluttbrev` - Final completion letter

### Response Naming Convention
- `[request]mottatt` - Acknowledged/received (optional)
- `[request]oppdatering` - Update/progress (optional) 
- `[request]fullfort` - Completed (required)
- `[request]utlopt` - Expired (when applicable)
- `feil` - Error response

## TypeScript vs TypeSpec

This repository maintains **dual definitions**:

### TypeScript Files (`*.ts`)
- **Primary source of truth** for API contracts
- Used directly by TypeScript/JavaScript consumers
- Contains comprehensive JSDoc comments and examples
- Should be **edited first** when making changes

### TypeSpec Files (`typespec/main.tsp`)
- Alternative schema definition language
- Generates OpenAPI 3.0 specifications
- **Now compiles successfully** and generates valid OpenAPI 3.0 specs
- Should be updated **after** TypeScript changes to maintain consistency

### Workflow for Changes
1. **Update TypeScript interfaces first** (`requestTypes.ts`, `callbackTypes.ts`)
2. **Mirror changes in TypeSpec** (`typespec/main.tsp`) 
3. **Test compilation**: `cd typespec && npx tsp compile .`
4. **Commit both versions together** to maintain sync

## Common Development Tasks

### Adding a New Message Type
1. Define request interface in `requestTypes.ts`
2. Define response interface(s) in `callbackTypes.ts` 
3. Add union type exports to `CallbackEvent` type
4. Update TypeSpec definitions in `typespec/main.tsp`
5. Create new documentation file in `docs/[message-type].md`
6. Add comprehensive examples and field descriptions to the new docs file
7. Update the table of contents in `README.md`
8. Create flow diagram in `images/` if complex workflow

### Updating Existing Messages
1. Modify TypeScript interfaces
2. Update corresponding TypeSpec models
3. Verify backward compatibility
4. Update examples in the relevant `docs/[message-type].md` file
5. Test with TypeSpec compiler

### PDF Generation Preferences
When working on PDF generation features, use **Inter** as the main font and **PT Serif** for heading elements in PDF generation.

## Message Examples Location

Detailed JSON examples for all message types are documented in separate files in the `docs/` directory:
- **[Boliginformasjon](docs/boliginformasjon.md)** - Property information request/response examples
- **[Forhåndsutlysing](docs/forhandsutlysing.md)** - Clarification request/response examples with flow states
- **[Salgsmelding](docs/salgsmelding.md)** - Sales notification with complete workflow examples
- **[Endring overdragelsesdato](docs/endring-overdragelsesdato.md)** - Transfer date change examples
- **[Endring kjøpere](docs/endring-kjopere.md)** - Buyer change examples
- **[Sluttbrev](docs/sluttbrev.md)** - Final completion letter examples
- **[Restanse](docs/restanse.md)** - Arrears handling (minimal, under development)
- **[Feilmeldinger](docs/feilmeldinger.md)** - Error response examples with error codes

Each file contains complete request/response examples, field descriptions, and workflow explanations specific to that message type.

## Development Guidelines

- **Maintain consistency** between TypeScript and TypeSpec definitions
- **Preserve backward compatibility** when modifying existing interfaces
- **Use Norwegian field names** consistently (kjopesum, salgsmelding, etc.)
- **Document complex flows** with sequence diagrams in README
- **Include comprehensive examples** for all new message types
- **Test TypeSpec compilation** before committing changes

## Troubleshooting

### TypeSpec Development
The TypeSpec setup is now working correctly. If you encounter issues:

1. Ensure all dependencies are installed: `cd typespec && npm install`
2. Run compilation to check for errors: `npx tsp compile .`
3. Check that the generated OpenAPI file exists: `tsp-output/@typespec/openapi3/openapi.yaml`
4. When making changes, update TypeScript files first, then mirror in TypeSpec

### Missing Dependencies
```bash
cd typespec/
npm install
```

This installs the TypeSpec compiler and OpenAPI 3.0 emitter tools.

### Regenerating OpenAPI Specification
After making changes to TypeSpec definitions:

```bash
cd typespec/
npx tsp compile .
```

The generated OpenAPI 3.0 specification will be available at `tsp-output/@typespec/openapi3/openapi.yaml`.
