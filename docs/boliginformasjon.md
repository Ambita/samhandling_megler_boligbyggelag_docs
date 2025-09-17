---
title: "Boliginformasjon - Property Information"
layout: default
---

# Information about the object / Boliginformasjon

The first thing a broker needs to do is to find out which operations can be done at all, which of them can be done digitally and which of them they need to continue to do manually. This can differ from one sales project to the next. This product can be ordered by the broker, and we will forward it to the correct recipient. If the recipient is not part of the system, we will inform the broker about this.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> infoReq["1.1.0<br/>Information request"]
  infoReq --> accountant([ACCOUNTANT])
  accountant --> infoRes["1.2.0<br/>Information response"]
  infoRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class infoReq request;
class infoRes response;
</div>

## Information request (Boliginformasjon)

On behalf of the broker the following request is made:

```json
{
  "type": "boliginformasjon",
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
  "estateId": "8edbaf12-7e21-4cf7-8d72-74277d004c32",
  "oppdragsnummer": "8-0148/23",
  "registerenhet": {
    "type": "matrikkel",
    "ident": "3802-71-119-0-21"
  },
  "bestiller": {
    "id": "TBF",
    "navn": "Broker Doe",
    "epost": "tbf@domene.no",
    "telefon": "79119911"

  },
  "meglerkontor": {
    "orgnr": "987654323",
    "avdelingsnr": "3",
    "navn": "Avdeling3",
    "adresse": {
      "gateadresse": "Testvei 3",
      "postnummer": "0030",
      "poststed": "OSLO"
    },
    "telefon": "12345678"
  },
  "kontaktperson": {
    "id": "AO",
    "navn": "Anne Olsen",
    "epost": "aol@domene.no",
    "telefon": "12548630"
  }
}
```

### Request fields that are in all requests

* type - The request message type. Defines the following flow. Can be one of four different types:
  * boliginformasjon
  * forhandsutlysing
  * salgsmelding
  * restanse
* ordreId (order id) - A unique identifier that will be included in the responses
* registerenhet (realty) - A cadastre, share, stock or obligation property
  * type - type of realty
    * matrikkel (cadastre) - This is a cadastre in the Land Registry
    * borettsandel (cooperative share) - This is a share in the Land Registry
    * aksjeandel (stock share) - This is a privately held share property
    * obligasjonsandel (bond share) - This is a privately held bond property
  * ident - the unique identifier for the realty
* bestiller (orderer) - The broker making the product order
  * id - A unique identifier within the broker office
  * navn (name) - The name of the broker
  * epost (e-mail) - The e-mail of the broker
  * telefon (phone) - The phone number of the broker
* meglerkontor (broker department)
  * orgnr (organisation number) - The organisation number of the broker
  * avdelingsnr (department number) - The broker department number
  * navn (name) - The name of the broker department
  * adresse (address) - The address of the broker department
    * gateadresse (street address) - The street address with number and letter
    * postnummer (postal number) - The postal number of the address
    * poststed (postal place) - The postal place name of the address
  * telefon - The phone number of the broker department
* kontaktperson (person to contact) - Person to contact about the order, e.g. the main broker
  * id - A unique identifier within the broker office
  * navn (name) - The name of the broker
  * epost (e-mail) - The e-mail of the broker
  * telefon (phone) - The phone number of the broker

## Information response (Boliginformasjon)

The accountant responds with information about the given object, here identified with the cadastre identity 3802-71-119-0-21. This response is just an example:

```json
{
  "forkjopsrett": {
    "harForkjopsrett": true,
    "kanForhandsutlyses": true,
    "intern": true,
    "bestillingsformat": "Elektronisk",
    "gebyr": 7225
  },
  "styregodkjenning": {
    "pakrevd": true,
    "bestillingsformat": "Manuelt",
    "mottakerType": "forretningsforer"
  },
  "salgsmelding": {
    "bestillingsformat": "Manuelt",
    "gebyr": 6850
  },
  "restanse": {
    "bestillingsformat": "Manuelt"
  },
  "andreHensyn": "Kundeforhold avsluttes 1.1.2023 - det gjenstår endel i forbindelse med regnskap og TPO for 2022",
  "type": "boliginformasjon",
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
  "forretningsforer": {
    "navn": "UNTL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no"
  },
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202",
    "epost": "styret@brl.no",
    "styreleder": {
      "navn": "Ole Styreleder",
      "epost": "leder@brl.no",
      "telefonnr": "99889988"
    }
  },
  "levert": "2022-07-07T15:48:07.6328836Z",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

### Response fields

General comment. For each step in the process, we have a field called "bestillingsformat". This field can be of two types: "Elektronisk" or "Manuelt". "Elektonisk" means that the step can be completed through the integration. "Manuelt" means it must be done manually. In other words, it must be done the same way as before.

* forkjopsrett (right of first refusal)
  * harForkjopsrett (has right of first refusal) - true if the object supports right of first refusal
  * kanForhandsutlyses (supports advance notice) - true if right of first refusal can be ordered in advance  
  * intern (internal) - true if right is only available inside the cooperative
  * bestillingsformat (order format) - Elektronisk (Electronic) or Manuelt (Manually).
  * mottakerType (recipient type) - if bestillingsformat is "Manuelt" then mottakerType is either "forretningsforer" (accountant) or "lag" (client)
  * gebyr (fee) - The price of the right of first refusal clarification
* styregodkjenning (board approval)
  * pakrevd (required) - need board approval before moving into object
  * bestillingsformat (order format) - See above
  * mottakerType (recipient type) - See above
* salgsmelding (sales message)
  * bestillingsformat (order format) - See above
  * gebyr (fee) - The price of performing the change of ownership
* restanse (arrears)
  * bestillingsformat (order format) - See above
* andre hensyn (other considerations) - Textual explanation of things one need to consider
* type (message type)
* ordreId (order id)
* forretningsforer (accountant) - Information about the company that handles this object
  * navn (name) - name of company
  * adresse (address) - address of company
  * epost (email) - email to company
* klient - Information about the company that is the owner of the realities. Required for all callback types except callback type "feil"
  * klienttype (client type) - The type of client (see list of examples)
  * organisasjonsnavn (organization name) - The client's name 
  * organisasjonsnummer (organization number) - The client's organization number
  * epost (email) - Email to the client
  * styreleder (chairperson) - The person leading the board
    * navn (name) - Chairperson's name
    * epost (email) - Chairperson's email address
    * telefonnr (phone numer) - Chairperson's phone number
* levert (delivered) - timestamp when the response message was created
* referanse (reference) - a reference to the assignment from the accountant
* eierform (type of ownership) - can be Andelseier, Seksjonseier or Aksjonær

When our system receives this message, it will construct a styled document as a PDF and deliver it directly to the broker system.

### List of client types:
* Borettslag tilknyttet
* Tilknyttet annet boligbyggelag
* Tilknyttet boligsameie
* Tilknyttet-Ikke forkjøpsrett/forr.førs
* Forkjøpsrettsavklaring/ikke forr.fører
* Forkjøpsrett selveier/ikke forr.førsel
* Boligsameie
* Forening
* Borettslag frittstående
* Aksjeselskap, Bolig AS
* Garasjelag
* Parkeringssameie
* Tingrettslig sameie
