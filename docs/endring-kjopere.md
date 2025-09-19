---
title: "Endring kjøpere - Change of Buyers"
layout: default
---

<div class="language-content lang-en" markdown="1">

# Change of buyers

When the list of buyers changes after the original sales message was submitted, the broker sends a change-of-buyers request. The accountant confirms whether the update requires renewed board approval and eventually signals that the process is complete.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> changeBuyers["4.3.0<br/>Change buyers request"]
  changeBuyers --> accountant([ACCOUNTANT])
  accountant -.-> received["4.3.1<br/>Change buyers received response"]
  received -.-> ambita
  accountant --> completed["4.3.2<br/>Change buyers completed response"]
  completed --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class changeBuyers request;
class received,completed response;
</div>

## Change of buyers request

```json
{
  "type": "endringkjopere",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "kjopere": [
    {
      "id": "12345",
      "fornavn": "Ola",
      "etternavn": "Nordmann",
      "epost": "ola@example.no",
      "telefon": "12345678",
      "adresse": {
        "gateadresse": "Strandgaten 3",
        "postnummer": "5000",
        "poststed": "Bergen"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    },
    {
      "id": "67890",
      "fornavn": "Kari",
      "etternavn": "Nordmann",
      "epost": "kari@example.no",
      "telefon": "98765432",
      "adresse": {
        "gateadresse": "Strandgaten 3",
        "postnummer": "5000",
        "poststed": "Bergen"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    }
  ]
}
```

### Additional fields specific for buyer changes

For common request fields see [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests).

* kjopere - Complete replacement list of buyers to register after the change.

## Change of buyers received response

This optional response is sent if the accountant needs renewed board approval before final confirmation.

```json
{
  "type": "endringkjoperemottatt",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "levert": "2024-02-07T10:05:48+02:00",
  "referanse": "622/1",
  "eierform": "Andelseier",
  "ordreMottatt": "2024-02-07T09:45:20+02:00",
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "initiertDato": "2024-02-07",
    "meldefrist": "2024-02-21T12:00:00+02:00"
  }
}
```

### Fields specific for the received response

* ordreMottatt - When the change request was received.
* styregodkjenningPakrevd - Whether a new board approval is required.
* styregodkjenning - Additional metadata when board approval is required, including who handles the case (`handteresAvForretningsforer`), when it started (`initiertDato`) and the response deadline (`meldefrist`).

## Change of buyers completed response

The accountant sends this response when the change has been processed.

```json
{
  "type": "endringkjoperefullfort",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "levert": "2024-02-19T15:45:12+02:00",
  "referanse": "622/1",
  "eierform": "Andelseier",
  "ordreMottatt": "2024-02-07T09:45:20+02:00",
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "initiertDato": "2024-02-07",
    "meldefrist": "2024-02-21T12:00:00+02:00",
    "statusStyregodkjenning": "godkjent_av_styret",
    "andreHensyn": "Styret ønsker bekreftelse ved videre endringer"
  }
}
```

### Fields specific for the completed response

* ordreMottatt - When the change request was received.
* styregodkjenningPakrevd - Whether board approval was required for the change.
* styregodkjenning - Final board approval details when relevant, including outcome (`statusStyregodkjenning`) and any other notes (`andreHensyn`).

</div>

<div class="language-content lang-no" lang="no" markdown="1">

# Endring kjøpere

Når kjøperlisten endrer seg etter at salgsmeldingen er sendt, bestiller megler en endring av kjøpere. Forretningsfører bekrefter om oppdateringen krever ny styregodkjenning og varsler når prosessen er fullført.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> changeBuyers["4.3.0<br/>Bestilling av kjøperendring"]
  changeBuyers --> accountant([FORRETNINGSFØRER])
  accountant -.-> received["4.3.1<br/>Melding: endring mottatt"]
  received -.-> ambita
  accountant --> completed["4.3.2<br/>Melding: endring fullført"]
  completed --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class changeBuyers request;
class received,completed response;
</div>

## Forespørsel om endring av kjøpere

```json
{
  "type": "endringkjopere",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "kjopere": [
    {
      "id": "12345",
      "fornavn": "Ola",
      "etternavn": "Nordmann",
      "epost": "ola@example.no",
      "telefon": "12345678",
      "adresse": {
        "gateadresse": "Strandgaten 3",
        "postnummer": "5000",
        "poststed": "Bergen"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    },
    {
      "id": "67890",
      "fornavn": "Kari",
      "etternavn": "Nordmann",
      "epost": "kari@example.no",
      "telefon": "98765432",
      "adresse": {
        "gateadresse": "Strandgaten 3",
        "postnummer": "5000",
        "poststed": "Bergen"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    }
  ]
}
```

### Tilleggsfelter for kjøperendringer

Felles felter for forespørsler er beskrevet under [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests).

* kjopere – komplett oppdatert liste over kjøpere som skal registreres etter endringen.

## Melding om mottatt endring

Denne valgfrie meldingen brukes når forretningsfører trenger ny styregodkjenning før endringen kan ferdigstilles.

```json
{
  "type": "endringkjoperemottatt",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "levert": "2024-02-07T10:05:48+02:00",
  "referanse": "622/1",
  "eierform": "Andelseier",
  "ordreMottatt": "2024-02-07T09:45:20+02:00",
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "initiertDato": "2024-02-07",
    "meldefrist": "2024-02-21T12:00:00+02:00"
  }
}
```

### Felter i mottatt-meldingen

* ordreMottatt – tidspunktet vi mottok forespørselen.
* styregodkjenningPakrevd – om ny styregodkjenning er nødvendig.
* styregodkjenning – metadata ved behov for styregodkjenning, inkludert hvem som håndterer saken (`handteresAvForretningsforer`), startdato (`initiertDato`) og svarfrist (`meldefrist`).

## Melding om fullført endring

Forretningsfører sender denne meldingen når endringen er ferdig behandlet.

```json
{
  "type": "endringkjoperefullfort",
  "ordreId": "c836ef9d-6a27-4a61-9c52-6807f8a1a0e4",
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
  "levert": "2024-02-19T15:45:12+02:00",
  "referanse": "622/1",
  "eierform": "Andelseier",
  "ordreMottatt": "2024-02-07T09:45:20+02:00",
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "initiertDato": "2024-02-07",
    "meldefrist": "2024-02-21T12:00:00+02:00",
    "statusStyregodkjenning": "godkjent_av_styret",
    "andreHensyn": "Styret ønsker bekreftelse ved videre endringer"
  }
}
```

### Felter i fullført-meldingen

* ordreMottatt – tidspunktet forespørselen kom inn.
* styregodkjenningPakrevd – om endringen krevde styregodkjenning.
* styregodkjenning – endelig informasjon om styregodkjenningen, inkludert resultat (`statusStyregodkjenning`) og eventuelle merknader (`andreHensyn`).

</div>
