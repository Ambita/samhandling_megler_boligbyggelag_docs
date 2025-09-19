---
title: "SumGjeld - Total Debt"
layout: default
---

<div class="language-content lang-en" markdown="1">

# Total Debt

SumGjeld is a standalone product that allows brokers to request the total debt amount for a specific property. This is a simplified alternative to the full Boliginformasjon product when only debt information is needed.

This message type can be ordered at any time and does not interfere with other product messages. It shares similarities with the Boliginformasjon product but is much simpler and focused solely on debt information.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> debtReq["5.1.0<br/>Total debt request"]
  debtReq --> accountant([ACCOUNTANT])
  accountant --> debtRes["5.1.1<br/>Total debt response"]
  debtRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class debtReq request;
class debtRes response;
</div>

## Total debt request

On behalf of the broker the following request is made:

```json
{
  "type": "sumgjeld",
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

### Request fields

The SumGjeld request uses the same basic structure as other product requests. For detailed field explanations see [common request fields](boliginformasjon.md#request-fields-that-are-in-all-requests).

The request contains only the basic required fields:
* type - Set to "sumgjeld"
* All standard BasicProduct fields (ordreId, registerenhet, bestiller, meglerkontor, kontaktperson)

## Total debt response

The accountant responds with the total debt amount for the specified property:

```json
{
  "type": "sumgjeld",
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
  "sumGjeld": 45250.75,
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

The response includes all standard callback fields plus:

* **sumGjeld** (total debt) - The total debt amount in Norwegian kroner (NOK)
* **type** - Message type identifier ("sumgjeld")
* **ordreId** - The order ID from the request
* **forretningsforer** (accountant) - Information about the accountant handling this property
* **klient** - Information about the property owner organization
* **levert** (delivered) - Timestamp when the response was created
* **referanse** (reference) - Accountant's internal reference
* **eierform** (ownership type) - Type of ownership (Andelseier, Seksjonseier, Aksjonær)

When our system receives this message, it will make the debt information available to the broker system.

## Usage Notes

* This is an independent product that can be ordered at any time
* No special processing or approval workflows are involved
* The response provides only the debt amount, not detailed debt breakdown
* For comprehensive property information including debt details, use [Boliginformasjon](boliginformasjon.md) instead
* Production orders require using the `--profile ambitamain` option

</div>

<div class="language-content lang-no" lang="no" markdown="1">

# SumGjeld

SumGjeld er et frittstående produkt som lar megler bestille total gjeld for en bestemt eiendom. Dette er et forenklet alternativ til hele Boliginformasjon-produktet når du kun trenger gjeldsinformasjon.

Meldingstypen kan bestilles når som helst og påvirker ikke andre produktmeldinger. Strukturen ligner på Boliginformasjon, men er langt enklere og fokuserer utelukkende på gjeld.

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> debtReq["5.1.0<br/>Forespørsel om sum gjeld"]
  debtReq --> accountant([FORRETNINGSFØRER])
  accountant --> debtRes["5.1.1<br/>Svar med sum gjeld"]
  debtRes --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class debtReq request;
class debtRes response;
</div>

## Forespørsel om sum gjeld

På vegne av megler sendes følgende forespørsel:

```json
{
  "type": "sumgjeld",
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

### Felt i forespørselen

SumGjeld-forespørselen bruker samme grunnstruktur som andre produktmeldinger. Detaljert feltsbeskrivelse finner du under [felles felter for forespørsler](boliginformasjon.md#request-fields-that-are-in-all-requests).

Forespørselen inneholder kun de obligatoriske basisfeltene:
* type – skal settes til "sumgjeld"
* Alle standard felter i BasicProduct (ordreId, registerenhet, bestiller, meglerkontor, kontaktperson)

## Svar med sum gjeld

Forretningsfører svarer med totalt gjeldsbeløp for angitt eiendom:

```json
{
  "type": "sumgjeld",
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
  "sumGjeld": 45250.75,
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

### Felt i svaret

Svaret inkluderer alle standard callback-felter og i tillegg:

* **sumGjeld** (total gjeld) – totalbeløp i norske kroner (NOK)
* **type** – meldingstypen ("sumgjeld")
* **ordreId** – ordre-ID fra forespørselen
* **forretningsforer** – informasjon om forretningsføreren som håndterer eiendommen
* **klient** – informasjon om eierorganisasjonen
* **levert** – tidspunkt for når svaret ble produsert
* **referanse** – intern referanse hos forretningsføreren
* **eierform** – type eierskap (andelseier, seksjonseier, aksjonær)

Når systemet vårt mottar denne meldingen, gjøres gjeldsinformasjonen tilgjengelig i meglerløsningen.

## Brukstips

* Produktet kan bestilles uavhengig av de andre meldingstypene
* Ingen spesielle prosesser eller godkjenninger er nødvendig
* Svaret inneholder kun totalbeløpet, ikke en detaljerte oppstilling av gjelden
* For mer omfattende eiendomsinformasjon med gjeldsdetaljer bør du bruke [Boliginformasjon](boliginformasjon.md)
* I produksjon må bestillingen bruke `--profile ambitamain`

</div>
