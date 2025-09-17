---
title: "Endring overdragelsesdato - Change Transfer Date"
layout: default
---

# Change transfer date / Endring overdragelsesdato

The transfer date might change after the initial sales message has been sent from the broker to the accountant. If this happens this message can be used to inform about the change.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> changeReq["4.1.0<br/>Change transfer date request"]
  changeReq --> accountant([ACCOUNTANT])
  accountant --> changeRes["4.2.0<br/>Change transfer date response"]
  changeRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class changeReq request;
class changeRes response;
</div>

## Change of transfer date request (Endring overdragelsesdato)

```json
{
  "type": "endringoverdragelse",
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
  },
  "salgsmeldingOrdreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "datoOverdragelse": "2024-02-01T12:00:00+02:00"
}
```

### Additional fields specific for transfer date changes

For common request fields see [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests)

* salgsmeldingOrdreId - Reference to the original sales message order ID
* datoOverdragelse - The new transfer date

## Change of transfer date processed (Endring overdragelsesdato behandlet)

The change of transfer date is a very simple change on the accountant side and the response will tell whether the change will be done or not:

```json
{
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
  "type": "endringoverdragelse",
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
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-07-08T14:48:03.7537667+00:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier",
  "datoEndret": false,
  "avvisningsarsak": "Dato passert"
}
```

### Response fields specific for transfer date changes

* datoEndret - true if date was changed, false if not
* avvisningsarsak - optional text field to explain the reason for not changing the transfer date
