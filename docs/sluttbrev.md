---
title: "Sluttbrev - Final Letter"
layout: default
---

# Final letter / Sluttbrev

When the ownership transfer process is complete the broker can send a message to the accountant to inform about this. The accountant can then accept the change.

## Final letter request (Sluttbrev)

```json
{
  "type": "sluttbrev",
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
  "oppdragsnummer": "8-0148/23",
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
  "tinglysteEiere": [
    {
      "id": "12345",
      "fornavn": "Ola",
      "etternavn": "Nordmann",
      "adresse": {
        "gateadresse": "Testveg 1",
        "postnummer": "0010",
        "poststed": "OSLO"
      },
      "epost": "test@kjoper.no",
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 1
      }
    }
  ],
  "registerforteEiere": [
    {
      "id": "12345",
      "fornavn": "Ola",
      "etternavn": "Nordmann",
      "adresse": {
        "gateadresse": "Testveg 1",
        "postnummer": "0010",
        "poststed": "OSLO"
      },
      "epost": "test@kjoper.no",
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 1
      }
    }
  ],
  "datoOverdragelse": "2022-09-01T12:00:00+02:00",
  "forkjopsrettAvklart": true,
  "styregodkjenningAvklart": true
}
```

### Additional fields specific for final letter requests

For common request fields see [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests)

* tinglysteEiere - list of owners registered in the land register
* registerforteEiere - list of owners registered in the register
* forkjopsrettAvklart - true if right of first refusal has been clarified
* styregodkjenningAvklart - true if board approval has been clarified

## Final letter processed (Sluttbrev behandlet)

The response here is a confirmation that the final letter has been processed.

```json
{
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
  "type": "sluttbrevbehandlet",
  "ordreMottatt": "2022-07-08T14:48:03.7753374Z",
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-07-08T14:48:03.7537667+00:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```
