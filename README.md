# Samhandling Megler Boligbyggelag

Documentation for cooperation between brokers and housing federations

Ambita has designed a set of api messages to capture the flow between a broker and a housing federation. We have split the process into four separate steps:

1. Boliginformasjon (Information about the object). Used to inform the broker about which rules apply to the sale of the given object.
2. Forhåndsutlysing (Advance clarification). If the seller want to, he or she can clarify any preemption before the object is sold.
3. Salgsmelding (Sales message). The broker informs about the object being sold .
4. Restanse (Arrears). The broker request what payment needs to be fulfilled.

## Messages

In more detail the message format and process is described per product. You may take a look at typescript types for the messages here:

* [Request types](requestTypes.ts)
* [Response types](callbackTypes.ts)

### Boliginformasjon

The first thing a broker needs to do is to find out which operations can be done at all, which of them can be done digitally and which of them they need to continue to do manually. This can differ from one job to the next. This product can be ordered by the broker, and we will forward it to the correct recipient. If the recipient is not part of the system, yet we will inform the broker about this.

#### Request

First on behalf of the broker the following request is made, the request

```json
{
  "type": "boliginformasjon",
  "ordreId": "1888e14e-1418-4d37-b3be-0d0b623681ba",
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

#### Request fields that are in all requests

* type - The request message type. Defines the diffent flows. Can be of four different types:
  * boliginformasjon
  * forhandsutlysing
  * salgsmelding
  * restanse.
* ordreId (order id) - A unique identifier that will be included in the responses
* registerenhet (realty) - A cadastre or share
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

#### Response

The housing federation responds with information about the given object, here identified with the cadastre identity 3802-71-119-0-21, the response is just a constructed example:

```json
{
  "forkjopsrett": {
    "harForkjopsrett": true,
    "intern": true,
    "bestillingsformat": "Elektronisk"
  },
  "styregodkjenning": {
    "pakrevd": true,
    "bestillingsformat": "Elektronisk"
  },
  "salgsmelding": {
    "bestillingsformat": "Manuelt"
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
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-07-07T15:48:07.6328836Z",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

#### Response fields

General comment. For each step in the process we have a field called "bestillingsformat". This field can be of two types; "Elektronisk" or "Manuelt". "Elektonisk" means that the step can be completed through the integration. "Manuelt" means it has to be done manually. In other words, it has to be done the same way as before.

* forkjopsrett (right of first refusal)
  * harForkjopsrett (has right of first refusal) - true if the object supports right of first refusal
  * intern (internal) - true if right is only available inside the cooperative
  * bestillingsformat (order format) - Elektronisk (Electronic) or Manuelt (Manually).
* styregodkjenning (board approval)
  * pakrevd (required) - need board approval before moving into object
  * bestillingsformat (order format) - See above
* salgsmelding (sales message)
  * bestillingsformat (order format) - See above
* restanse (arrears)
  * bestillingsformat (order format) - See above
* andre hensyn (other considerations) - Textual explanation of things one need to consider
* type (message type)
* ordreId (order id)
* forretningsforer (business manager) - Information about the company that handles this object
  * navn (name) - name of company
  * adresse (address) - address of company
  * epost (email) - email to company
* klient - Information about the company that is the owner of the realties. Required for all callbacktypes except callbacktype "feil"
* levert (delivered) - timestamp when the response message was created
* referanse (reference) - a reference to the assignement from the business manager
* eierform (type of ownership) - can be Andelseier, Seksjonseier or Aksjonær


When our system receives this message it will construct a styled document as a PDF and deliver it directly to the broker system.


### Forhåndsutlysing

If the seller wants to clarify the preemption before the sale is concluded they may ask the broker to order this. The response will come in two messages. One early message that explains the process and one late message that comes after the prcess has been completed, which may take a while.

#### Request

We will transmit the following message:

```json
{
  "type": "forhandsutlysing",
  "ordreId": "67289ec4-871d-4011-8bc9-c0e9de6e5a90",
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
  "bolig": {
    "prom": 120,
    "promBeskrivelse": "Bruksareal: 1. etasje: 62 kvm Primærrom: 1. etasje: 62 kvm",
    "bra": 130,
    "bta": 140
  },
  "prisantydning": 1000000
}
```
#### Extra request fields specific for preemption requests

* bolig (housing) - information about the object. Fetched from broker system
  * prom (primary room area) - The area you live in
  * promBeskrivelse (description of prom) - A written description of the object
  * bra (Usable area) - The usable area
  * bta (Gross area) - The total area
* prisantydning - price suggestion

After some processing the following early response message is returned, this message explains the steps that will be taken:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22T02:00:00+02:00",
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

#### Extra response fields specific for early clarification

* ordreMottatt (order received date) - when the clarification is received
* utlysingssted (annonuncement location) - where the clarification is annonunced
* utlysingsdato (annonuncement date) - when the clarification will be annonunced
* meldefrist (deadline) - respondants need to report before this time

In some cases the broker contacts the business manager to change the announcement period. Then a message with updated dates for announcment date and deadline are sent:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-24T02:00:00+02:00",
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

When the process is done the final message is sent, summing up the result. Only two extra fields are added here. Number of interested parties and how long the advance clarification lasts.

```json
{
  "antallInteressenter": 2,
  // Added to the last message
  "varighetForkjopsrett": "2022-09-20T12:10:53+03:00",
  // Added to the last message
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22T02:00:00+03: 00",
  "meldefrist": "2022-06-30T12: 00: 00+03: 00",
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

#### Extra response fields specific for late clarification

* antallInteressenter (number of interested) - Number of respondants to the clarification.
* varighetForkjopsrett (clarification valid through) - The date that the clarification expires

### Salgsmelding

When the object has been sold the broker sends a sales message. This message contains all the necessary information for updating data and proceed with clarification and board approval.

#### Request

An example json request can look like this:

```json
{
  "type": "salgsmelding",
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
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
    "navn": "Ola Nordmann",
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
    "navn": "Kari Nordmann",
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
    "datoOverdragelse": "2022-09-01T12:00:00+02:00"
  },
  "bolig": {
    "prom": 60,
    "promBeskrivelse": "",
    "bra": 70,
    "bta": 50,
    "antallRom": 4,
    "antallSoverom": 2,
    "energibokstav": "F",
    "energifargekode": "G",
    "heis": false,
    "veranda": true,
    "parkering": "",
    "oppvarming": ""
  }
}
```

#### Extra request fields specific for sales requests

* kjopere (buyers) - list of persons. Has same fields as "bestiller" but also includes
  * eierbrok (ownership fraction) - defines how large fraction this person will get
    * teller (numerator)
    * nevner (denominator)
* selgere (sellers) - list of persons. Same structure as buyers.
* salg (sale) - information about the sale
  * kjopesum (purchase price) - What the object was sold for
  * datoAkseptBud (bid accepted date) - The date the bid was accepted
  * datoOverdragelse (transfer date) - The date the object will be transferred
* bolig (housing) - information about the object. Fetched from broker system
  * prom (primary room area) - The area you live in
  * promBeskrivelse (description of prom) - A written description of the object
  * bra (Usable area) - The usable area
  * bta (Gross area) - The total area
  * antallRom (number of rooms)
  * antallSoverom (number of bedrooms)
  * energibokstav (energy letter) - How energy efficient the object is (A-G)
  * energifargekode (energy color code) - (green, lightgreen, yellow, orange, red)
  * heis (elevator) - If the object has an elevator (true/false)
  * veranda (balcony) - If the object has a balcony (true/false)
  * parkering (parking) - Text field about parking
  * oppvaring (heating) - Text field about heating

After receiving and processing the sales request message a message received an immidiate response with information about what will be done:

```json
{
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "type": "salgsmeldingmottatt",
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
  "avklaring": {
    "harForkjopsrett": true,
    "type": "Fastpris",
    "utlysingsdato": "2022-07-02T12:00:00+02:00",
    "utlysingssted": "https://untl.no",
    "meldefrist": "2022-07-12T12:00:00+02:00"
  },
  "styregodkjenning": {
    "pakrevd": true,
    "initiertDato": "2022-07-12T12:00:00+02:00",
    "meldefrist": "2022-07-22T12:00:00+02:00"
  },
  "tilknyttetLag": true
}
```

#### Extra response fields specific for sale message received

* avklaring (clarification)
  * harForkjopsrett (has right of first refusal) - true if clarification needed
  * type (type of clarification) - if this block is needed the field may be Fastpris or Forhåndsutlyst
  * utlysingsdato - see clarification response
  * utlysingssted - see clarification response
  * meldefrist - see clarification response
* styregodkjenning (board approval)
  * pakrevd (required) - true if this is needed
  * initiertDato (date initialised) - The date the board will be notified
  * meldefrist (deadline) - The date the board needs to respond before
* tilknyttetlag (connected to a cooperative)

Later, when all the processes like clarification and board approval has been completed a final response is sent:

```json
{
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
  "type": "salgsmeldingfullfort",
  "klient": {
    "klienttype": "Borettslag tilknyttet",
    "organisasjonsnavn": "Skauen Borettslag",
    "organisasjonsnummer": "948677202"
  },
  "levert": "2022-07-22T12:00:00+02:00",
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
  "styregodkjenning": {
    "status": "Innvilget",
    "andreHensyn": "Tekst om andre hensyn kommer her"
  },
  "forkjopsrett": {
    "status": "Forkjøpsrett benyttet",
    "andreHensyn": "Tekst om andre hensyn kommer her",
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
}
```

#### Extra response fields specific for sale message completed

* styregodkjenning (board approval)
  * status - "Innvilget" means approved
  * andreHensyn (considerations) - Description of things to consider
* forkjopsrett (advance clarification)
  * status - "Forkjøpsrett benyttet" means someone else aquiered the object
  * andreHensyn (considerations) - Description of things to consider
  * kjopere (buyers) - List of new buyers that replace the original buyers

### Errors

Errors might happen. If we get into a situation where the responding system needs to send an error the following message may be used:

```json
{
  "tidspunkt": "2022-07-08T14:48:03.7753374Z",
  "kansellert": true,
  "feilmelding": "Forrige forhåndsutlysing-request har ikke utløpt ennå.",
  "feilkode": 3,
  "type": "feil",
  "ordreId": "60dbe743-3edf-44f4-92e5-0922dd82ba6e",
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

Here we include:

* feilkode (error code) - A predefined unique identifier for this error case
* feilmelding (error message) - A descriptive text explaining the error situation
* kansellert (Cancelled) - A boolean field indicating if this error cancels the whole order
