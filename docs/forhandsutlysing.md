---
title: "Forhåndsutlysing - Advance Clarification"
layout: default
---

<div class="language-content lang-en" markdown="1">

# Clarification

If the seller wants to clarify the preemption before the sale is concluded they may ask the broker to order this. The response will come in two messages. One early message that explains the process and one late message that comes after the process has been completed, which may take a while.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> clarReq["2.1.0<br/>Clarification request"]
  clarReq --> accountant([ACCOUNTANT])
  accountant --> early["2.2.0<br/>Early clarification response"]
  early --> ambita
  accountant -.-> delayed["2.2.1<br/>Clarification delayed response"]
  delayed -.-> ambita
  accountant --> late["2.2.2<br/>Late clarification response"]
  late --> ambita
  accountant -.-> expired["2.2.3<br/>Clarification expired response"]
  expired -.-> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class clarReq request;
class early,delayed,late,expired response;
</div>

## Clarification request

We will transmit the following request message:

```json
{
  "type": "forhandsutlysing",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
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
  "selgere": [
    {
      "id": "54321",
      "fornavn": "Kari",
      "etternavn": "Hansen",
      "epost": "kari@selger.no",
      "telefon": "98765432",
      "adresse": {
        "gateadresse": "Selgerveien 7",
        "postnummer": "0450",
        "poststed": "OSLO"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 1
      }
    }
  ],
  "bolig": {
    "prom": 120,
    "bra": 130,
    "braI": 120,
    "braE": 5,
    "braB": 5,
    "bta": 140
  },
  "prisantydning": 1000000
}
```

### Extra request fields specific for preemption requests

For the other fields explanations see [common request fields](boliginformasjon.md#request-fields-that-are-in-all-requests)

* bolig (housing) - information about the object. Fetched from broker system
  * prom (sum primærrom)
  * bra (sum bruksareal)
  * braI (sum internt bruksareal)
  * braE (sum eksternt bruksareal)
  * braB (sum innglasset balkong)
  * braS (sum salgbart bruksareal, brukes for næring)
  * bta (bruttoareal)
  * tba (sum terrasse- og balkongareal/åpent areal)
  * srom (sum sekundærrom)
* selgere (sellers) - list of owners pulled from the broker system. Uses the same structure as buyers in the sales message
* prisantydning - price suggestion

## Early clarification response

After some processing the following early response message is returned, this message explains the steps that will be taken:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22",
  "meldefrist": "2022-06-30T12:00:00+02:00",
  "type": "forhandsutlysingtidlig",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-07T18:42:51.3081344+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

### Extra response fields specific for early clarification

* ordreMottatt (order received date) - when the clarification was received
* utlysingssted (announcement location) - where the clarification is announced
* utlysingsdato (announcement date) - when the clarification will be announced
* meldefrist (deadline) - respondents need to report before this time

## Clarification delayed response

In some cases, the broker contacts the accountant to change the announcement period. Right now, this will be done manually. The following response message with updated announcement date and deadline are sent to inform the broker about the change:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-24",
  "meldefrist": "2022-07-02T12:00:00+02:00",
  "type": "forhandsutlysingutsatt",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-08T18:42:51.3081344+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

## Late clarification response

When the process is done the final message is sent, summing up the result. Only two extra fields are added here; number of interested parties and how long the advance clarification lasts.

```json
{
  "antallInteressenter": 2,
  "varighetForkjopsrett": "2022-09-20",
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22",
  "meldefrist": "2022-06-30T12:00:00+02:00",
  "type": "forhandsutlysingsen",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-27T18:44:15.8474644+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

### Extra response fields specific for late clarification

* antallInteressenter (number of interested) - Number of respondents to the clarification.
* varighetForkjopsrett (clarification valid through) - The date that the clarification expires

## Clarification expired response

A clarification is usually valid for three months. When it expires you need a new clarification. If not, the following sales message will result in a fixed price clarification. The accountant may inform the broker about this expiration using a specific response message. This basic message does not contain any product specific data fields. It will result in a message to the broker.

```json
{
  "type": "forhandsutlysingutlopt",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
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
  "levert": "2022-07-27T18:44:15.8474644+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

</div>

<div class="language-content lang-no" lang="no" markdown="1">

# Forhåndsutlysing

Selger kan ønske å avklare forkjøpsretten før salget avsluttes. Da bestiller megler en forhåndsutlysing. Forløpet består av en tidlig melding som beskriver prosessen, eventuelle justeringer underveis og en sluttrapport når avklaringen er ferdig. Prosessen kan ta noe tid.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> clarReq["2.1.0<br/>Bestilling: forhåndsutlysing"]
  clarReq --> accountant([FORRETNINGSFØRER])
  accountant --> early["2.2.0<br/>Svar: forhåndsutlysing tidlig"]
  early --> ambita
  accountant -.-> delayed["2.2.1<br/>Svar: forhåndsutlysing utsatt"]
  delayed -.-> ambita
  accountant --> late["2.2.2<br/>Svar: forhåndsutlysing sen"]
  late --> ambita
  accountant -.-> expired["2.2.3<br/>Varsel: forhåndsutlysing utløpt"]
  expired -.-> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class clarReq request;
class early,delayed,late,expired response;
</div>

## Forespørsel om forhåndsutlysing

Vi sender følgende bestilling til forretningsfører:

```json
{
  "type": "forhandsutlysing",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
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
  "selgere": [
    {
      "id": "54321",
      "fornavn": "Kari",
      "etternavn": "Hansen",
      "epost": "kari@selger.no",
      "telefon": "98765432",
      "adresse": {
        "gateadresse": "Selgerveien 7",
        "postnummer": "0450",
        "poststed": "OSLO"
      },
      "eierbrok": {
        "teller": 1,
        "nevner": 1
      }
    }
  ],
  "bolig": {
    "prom": 120,
    "bra": 130,
    "braI": 120,
    "braE": 5,
    "braB": 5,
    "bta": 140
  },
  "prisantydning": 1000000
}
```

### Tilleggsfelter for forhåndsutlysinger

Felles felter for forespørsler er dokumentert under [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests).

* bolig – informasjon om objektet hentet fra meglersystemet
  * prom – sum primærrom
  * bra – sum bruksareal
  * braI – sum internt bruksareal
  * braE – sum eksternt bruksareal
  * braB – sum innglasset balkong
  * braS – sum salgbart bruksareal (brukes for næring)
  * bta – bruttoareal
  * tba – sum terrasse- og balkongareal/åpent areal
  * srom – sum sekundærrom
* selgere – liste over registrerte eiere, samme struktur som kjøpere i salgsmeldingen
* prisantydning – meglerens prisvurdering

## Tidlig svar på forhåndsutlysing

Etter innledende behandling sender forretningsfører et tidlig svar som beskriver videre prosess:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22",
  "meldefrist": "2022-06-30T12:00:00+02:00",
  "type": "forhandsutlysingtidlig",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-07T18:42:51.3081344+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

### Felter i det tidlige svaret

* ordreMottatt – tidspunkt bestillingen ble registrert
* utlysingssted – hvor forkjøpsretten blir annonsert
* utlysingsdato – dato for publisering
* meldefrist – siste frist for interessenter til å melde seg

## Utsatt forhåndsutlysing

Megler kan be om å endre utlysningsperioden. Endringen gjøres manuelt, og forretningsfører sender et oppdatert svar for å informere megler:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-24",
  "meldefrist": "2022-07-02T12:00:00+02:00",
  "type": "forhandsutlysingutsatt",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-08T18:42:51.3081344+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

## Sen forhåndsutlysing

Når prosessen er ferdig, sendes et sluttsvar som oppsummerer resultatet. Her legges det til to felter: antall interessenter og hvor lenge avklaringen gjelder.

```json
{
  "antallInteressenter": 2,
  "varighetForkjopsrett": "2022-09-20",
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22",
  "meldefrist": "2022-06-30T12:00:00+02:00",
  "type": "forhandsutlysingsen",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
  "ordreMottatt": "2022-07-06T15:48:07.6328836Z",
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
  "levert": "2022-07-27T18:44:15.8474644+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

### Felter i sluttsvaret

* antallInteressenter – antall interessenter som meldte forkjøpsrett
* varighetForkjopsrett – datoen forkjøpsretten utløper

## Varsel om utløpt forhåndsutlysing

En forhåndsavklaring er normalt gyldig i tre måneder. Når perioden utløper må en ny forhåndsutlysing bestilles, ellers utløses fastprisprosessen ved neste salgsmelding. Forretningsfører kan varsle megler om utløpet med denne meldingen, som ikke har egne produktfelter:

```json
{
  "type": "forhandsutlysingutlopt",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
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
  "levert": "2022-07-27T18:44:15.8474644+02:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

</div>
