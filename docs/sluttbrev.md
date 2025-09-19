---
title: "Sluttbrev - Final Letter"
layout: default
---

<div class="language-content lang-en" markdown="1">

# Final letter

When the ownership transfer process is complete the broker can send a message to the accountant to inform about this. The accountant can then accept the change.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> finalReq["6.1.0<br/>Final letter request"]
  finalReq --> accountant([ACCOUNTANT])
  accountant --> finalRes["6.1.1<br/>Final letter accepted"]
  finalRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class finalReq request;
class finalRes response;
</div>

## Final letter request

```json
{
  "type": "sluttbrev",
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
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

## Final letter accepted

The response here is a confirmation that the final letter has been processed.

```json
{
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
  "type": "sluttbrevakseptert",
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
  "eierform": "Seksjonseier"
}
```

</div>

<div class="language-content lang-no" lang="no" markdown="1">

# Sluttbrev

Når eierskiftet er gjennomført, kan megler sende sluttbrev til forretningsfører for å bekrefte at prosessen er ferdig. Forretningsfører returnerer en kvittering når endringen er akseptert.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> finalReq["6.1.0<br/>Bestilling: sluttbrev"]
  finalReq --> accountant([FORRETNINGSFØRER])
  accountant --> finalRes["6.1.1<br/>Svar: sluttbrev akseptert"]
  finalRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class finalReq request;
class finalRes response;
</div>

## Forespørsel om sluttbrev

```json
{
  "type": "sluttbrev",
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
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

### Tilleggsfelter for sluttbrev

Felles felter for forespørsler er dokumentert under [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests).

* tinglysteEiere – eiere registrert i grunnboken
* registerforteEiere – eiere registrert i forretningsførerens register
* forkjopsrettAvklart – sann dersom forkjøpsretten er avklart
* styregodkjenningAvklart – sann dersom styregodkjenning er avklart

## Sluttbrev akseptert

Svaret bekrefter at sluttbrevet er behandlet og arkivert.

```json
{
  "ordreId": "30db5678-345f-4dh4-92e5-09d2dh82dase",
  "type": "sluttbrevakseptert",
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
  "eierform": "Seksjonseier"
}
```

</div>
