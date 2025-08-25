# Samhandling Megler Boligbyggelag

Documentation for cooperation between brokers and accountants

Ambita has designed a set of API messages to capture the flow between a broker and an accountant. We have split the process into separate steps:

1. **Boliginformasjon** (Information about the object). Used to inform the broker about which rules that apply to the sale of a given object.
2. **Forhåndsutlysing** (Advance clarification). If the seller wants to, he or she can clarify any preemption before the object is sold.
3. **Salgsmelding** (Sales message). The broker informs the accountant about the object being sold.
4. **Endring overdragelsesdato** (Change of transfer date). The broker requests a new transfer date
5. **Endring kjøpere** (Change of buyers). The broker requests a change of buyers (new owners)
6. **Sluttbrev** (Final letter). The accountant accepts that the process is completed.
7. **Restanse** (Arrears). The broker requests what payment needs to be fulfilled.

## Documentation

### Message Types

* **[Boliginformasjon](docs/boliginformasjon.md)** - Property information requests
* **[Forhåndsutlysing](docs/forhandsutlysing.md)** - Advance clarification of preemption rights
* **[Salgsmelding](docs/salgsmelding.md)** - Sales notifications and ownership transfers
* **[Endring overdragelsesdato](docs/endring-overdragelsesdato.md)** - Transfer date changes
* **[Endring kjøpere](docs/endring-kjopere.md)** - Buyer changes
* **[Sluttbrev](docs/sluttbrev.md)** - Final completion letters
* **[Restanse](docs/restanse.md)** - Arrears handling
* **[Feilmeldinger](docs/feilmeldinger.md)** - Error messages

### Type Definitions

The message format and process is described in more detail per product. You may take a look at the typescript types for the messages here:

* [Request types](requestTypes.ts)
* [Response types](callbackTypes.ts)

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
