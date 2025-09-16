---
title: "Salgsmelding - Sales Message"
layout: default
---

# Sales message / Salgsmelding

When the object has been sold the broker sends a sales message to the accountant. This request message contains all the necessary information needed for updating data and proceed with clarification and board approval.

After issuing a sale message order the system expects up to three unique response messages:

When sending:

`salgsmelding`

The following responses can be used once, in order of appearance:

`salgsmeldingmottatt` (optional - clarifies process, can be omitted if no process is needed)

`salgsmeldingoppdatering` (optional - can be sent before board approval process completed)

`salgsmeldingfullfort` (required - expected at the end of the process - marks sale process completed)

<div class="mermaid">
flowchart LR
  ambita([AMBITA]) --> salesReq["3.1.0\nSales message request"]
  salesReq --> accountant([ACCOUNTANT])
  accountant -.-> received["3.2.0\nSales message received response"]
  received -.-> ambita
  accountant -.-> updated["3.2.1\nSales message updated response"]
  updated -.-> ambita
  accountant --> completed["3.2.2\nSales message completed response"]
  completed --> ambita

classDef actor fill:#ffcc00,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef request fill:#00ccff,stroke:#0a0f0f,stroke-width:1px,color:#000;
classDef response fill:#33dd33,stroke:#0a0f0f,stroke-width:1px,color:#000;
class ambita,accountant actor;
class salesReq request;
class received,updated,completed response;
</div>

## Sales message request (Salgsmelding)

An example json request can look like this:

```json
{
  "type": "salgsmelding",
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
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
  "kjopere": [{
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
  }],
  "selgere": [{
    "id": "54321",
    "organisasjonsnavn": "Kari Nordmann AS",
    "kontaktperson": "Kari Nordmann",
    "adresse": {
      "gateadresse": "Testveg 2",
      "postnummer": "0010",
      "poststed": "OSLO"
    },
    "epost": "test@selger.no",
    "telefon": "12345678",
    "eierbrok": {
      "teller": 1,
      "nevner": 1
    }
  }],
  "salg": {
    "kjopesum": 2990000,
    "datoAkseptBud": "2022-06-30T12:00:00+02:00",
    "datoOverdragelse": "2022-09-01T12:00:00+02:00",
    "forbeholdBud": "Innbo og parkeringsplass medfølger"
  },
  "bolig": {
    "prom": 60,
    "bra": 70,
    "braI": 65,
    "braE": 2,
    "braB": 3,
    "bta": 50,
    "antallRom": 4,
    "antallSoverom": 2,
    "energibokstav": "F",
    "energifargekode": "G",
    "heis": false,
    "veranda": true,
    "parkering": "",
    "oppvarming": "",
    "adresse": {
      "gateadresse": "Strandgaten 3",
      "postnummer": 5000,
      "poststed": "Bergen"
    },
    "leilighetsnummer": "H0101"
  }
}
```

### Extra request fields specific for sales requests

For common request fields see [boliginformasjon](boliginformasjon.md#request-fields-that-are-in-all-requests)

* oppdragsnummer - assignment number in the broker system
* kjopere (buyers) - list of persons or organizations. The structure also includes eierbrok (ownership fraction):
  * id - (identification) - A unique number that identifies the buyer, can be personal number or organization number
  * fornavn (first name) - Required for persons
  * etternavn (surname) - Required for persons
  * organisasjonsnavn (organization name) - Required for organizations
  * kontaktperson (contact person) - Required for organizations
  * adresse (address) - The address of the person or organization
    * gateadresse (street address) - The street address with number and letter
    * postnummer (postal number) - The postal number of the address
    * poststed (postal place) - The postal place name of the address
  * epost (e-mail) - The contact e-mail
  * telefon (phone) - The contact phone number
  * eierbrok (ownership fraction) - defines how large fraction this person will get
    * teller (numerator)
    * nevner (denominator)
* selgere (sellers) - list of persons. Same structure as buyers.
* salg (sale) - information about the sale
  * kjopesum (purchase price) - What the object was sold for
  * datoAkseptBud (bid accepted date) - The date the bid was accepted
  * datoOverdragelse (transfer date) - The date the object will be transferred
  * forbeholdBud (bid reservation) - Any special considerations for the bid as free text 
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
  * antallRom (number of rooms)
  * antallSoverom (number of bedrooms)
  * energibokstav (energy letter) - How energy efficient the object is (A-G)
  * energifargekode (energy color code) - (green, light green, yellow, orange, red)
  * heis (elevator) - If the object has an elevator (true/false)
  * veranda (balcony) - If the object has a balcony (true/false)
  * parkering (parking) - Text field about parking
  * oppvaring (heating) - Text field about heating
  * adresse (address) - housing address
  * leilighetsnummer (apartment number)

## Sales message received response (Salgsmelding mottatt)

After receiving and processing the sales request message, a message received an immediate response with information about what will be done:

```json
{
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "type": "salgsmeldingmottatt",
  "ordreMottatt": "2022-01-06T15:48:07.6328836Z",
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-06-30T12:00:00+02:00",
  "referanse": "1571/2",
  "eierform": "Seksjonseier",
  "forretningsforer": {
    "navn": "UNTL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no"
  },
  "harForkjopsrett": true,
  "forkjopsrett": {
    "typeAvklaring": "fastpris",
    "statusForhandsutlysing": "ikke_forhandsutlysing",
    "utlysingsdato": "2022-07-02T12:00:00+02:00",
    "utlysingssted": "https://untl.no",
    "meldefrist": "2022-07-12T12:00:00+02:00"
  },
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "initiertDato": "2022-07-12T12:00:00+02:00",
    "meldefrist": "2022-07-22T12:00:00+02:00"
  },
  "tilknyttetLag": true
}
```

### Extra response fields specific for sale message received

* ordreMottatt (order received date) - when the sale message was received
* harForkjopsrett (has right of first refusal) - true if clarification needed
* forkjopsrett (clarification) - if clarification needed
  * typeAvklaring (type of clarification) - if this block is needed the field may be Fastpris or Forhåndsutlyst
  * statusForhandsutlysing (status clarification) - if previous clarification has been done and with what status
  * utlysingsdato - see clarification response
  * utlysingssted - see clarification response
  * meldefrist - see clarification response
* styregodkjenningPakrevd (required) - true if board approval is needed
* styregodkjenning (board approval) - if board approval is needed
  * handteresAvForretningsforer (handled by accountant) - true if handled by the accountant. If false, no other fields should be filled out in styregodkjenning  
  * initiertDato (date initialised) - The date the board will be notified
  * meldefrist (deadline) - The date the board needs to respond before
* tilknyttetlag (connected to a cooperative)

## Sales message updated response (Salgsmelding oppdatert) 

After clarification and change of ownership has been handled by the accountant, an intermediate message may be sent containing everything except the board approval status. Please note that this message is not considered to be the final message. Every sale order is closed with the `salgsmeldingfullfort` message: 

```json
{
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "type": "salgsmeldingoppdatering",
  "ordreMottatt": "2022-01-06T15:48:07.6328836Z",
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-01-22T12:00:00+02:00",
  "referanse": "1571/2",
  "eierform": "Seksjonseier",
  "forretningsforer": {
    "navn": "UNTL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no",
    "epostRestanse": "restanse@kunde.no"
  },
  "styregodkjenningPakrevd": true,
  "harForkjopsrett": true,
  "forkjopsrett": {
    "statusForkjopsrett": "benyttet",
    "typeAvklaring": "fastpris",
    "statusForhandsutlysing": "med_interessenter",
    "utlysingsdato": "2022-01-07T12:00:00+02:00",
    "andreHensyn": "Tekst om andre hensyn kommer her"
  },
  "kjopere": [
    {
      "id": "01010112345",
      "fornavn": "Ole",
      "etternavn": "Duck",
      "epost": "ole@andeby.co",
      "adresse": {
        "gateadresse": "Testvegen 1",
        "postnummer": "9999",
        "poststed": "Test"
      },
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    },
    {
      "id": "01010154321",
      "fornavn": "Dole",
      "etternavn": "Duck",
      "epost": "dole@andeby.co",
      "adresse": {
        "gateadresse": "Testvegen 1",
        "postnummer": "9999",
        "poststed": "Test"
      },
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    }
  ]
}
```

## Sales message completed response (Salgsmelding fullført)

Later, when all the processes like clarification and board approval have been completed, a final response is sent:

```json
{
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "type": "salgsmeldingfullfort",
  "ordreMottatt": "2022-01-06T15:48:07.6328836Z",
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-01-22T12:00:00+02:00",
  "referanse": "1571/2",
  "eierform": "Seksjonseier",
  "forretningsforer": {
    "navn": "UNTL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no",
    "epostRestanse": "restanse@kunde.no"
  },
  "styregodkjenningPakrevd": true,
  "styregodkjenning": {
    "handteresAvForretningsforer": true,
    "statusStyregodkjenning": "godkjent_av_styret",
    "andreHensyn": "Tekst om andre hensyn kommer her"
  },
  "harForkjopsrett": true,
  "forkjopsrett": {
    "statusForkjopsrett": "benyttet",
    "typeAvklaring": "fastpris",
    "statusForhandsutlysing": "med_interessenter",
    "utlysingsdato": "2022-01-07T12:00:00+02:00",
    "andreHensyn": "Tekst om andre hensyn kommer her"
  },
  "kjopere": [
    {
      "id": "01010112345",
      "fornavn": "Ole",
      "etternavn": "Duck",
      "epost": "ole@andeby.co",
      "adresse": {
        "gateadresse": "Testvegen 1",
        "postnummer": "9999",
        "poststed": "Test"
      },
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    },
    {
      "id": "01010154321",
      "fornavn": "Dole",
      "etternavn": "Duck",
      "epost": "dole@andeby.co",
      "adresse": {
        "gateadresse": "Testvegen 1",
        "postnummer": "9999",
        "poststed": "Test"
      },
      "telefon": "12345678",
      "eierbrok": {
        "teller": 1,
        "nevner": 2
      }
    }
  ]
}
```

### Extra response fields specific for sale message update and sale message completed

* styregodkjenning (board approval)
  * statusStyregodkjenning - filled out if handled by the accountant
    * "godkjent_av_styret" - approved by the board
    * "avvist_av_styret" - not approved by the board
    * "godkjent_av_bbl" - approved by the accountant
    * "avvist_av_bbl" - not approved by the accountant
    * "frist_utlopt" - no response from board, handled as approved
  * andreHensyn (considerations) - Description of things to consider
* forkjopsrett (advance clarification)
  * statusForkjopsrett
    * "ikke_benyttet" - the initial buyers acquired the object
    * "benyttet" - one of the preemption respondents acquired the object 
  * andreHensyn (considerations) - Description of things to consider
* kjopere (buyers) - List of buyers registered by the business manager
