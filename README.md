# Samhandling Megler Boligbyggelag

Documentation for cooperation between brokers and housing federations

Ambita has designed a set of api messages to capture the flow between a broker and a housing federation. We have split the process into four separate steps:

1. Boliginformasjon (Information about the object). Used to inform the broker about which rules apply to the sale of the given object.
2. Forhåndsutlysing (Advance clarification). If the seller want to, he or she can clarify any preemption before the object is sold.
3. Salgsmelding (Sales message). The broker informs about the object being sold .
4. Restanse (Arrears). The broker request what payment needs to be fulfilled.

## Messages

In more detail the message format and process is described per product. You may take a look at typescript types for the messages here:

[Request types](requestTypes.ts)
[Response types](callbackTypes.ts)

### Boliginformasjon

The first thing a broker needs to do is to find out which operations can be done at all, which of them can be done digitally and which of them they need to continue to do manually. This can differ from one job to the next. This product can be ordered by the broker and we will forward it to the correct recipient. If the recipient is not part of the system yet we will inform the broker about this.

First on behalf of the broker the following request is made, the request

```json
{
  "type": "boliginformasjon",
  "lag": { 
    "navn": "Boligsameiet Blåklokken",
    "orgnr": "913861205"
  },
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
    }
  }
}
```

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
  "ordreId": "20aa6a2e-685d-4271-9182-8f2c1518f99a",
  "forretningsforer": {
    "navn": "UNTL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no"
  },
  "levert": "2022-07-07T15:48:07.6328836Z",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

When our system receives this message it will construct a styled document and deliver it directly to the broker.


### Forhåndsutlysing

If the seller wants to clarify the preemption before the sale is concluded they may ask the broker to order this. The response will come in two messages. One early message that explains the process and one late message that comes after the prcess has been completed, which may take a while. 

We will transmit the following message:

```json
{
  "type": "forhandsutlysing",
  "lag": { 
    "navn": "Boligsameiet Blåklokken",
    "orgnr": "913861205"
  },
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
    }
  }
}
```

After some processing the following early response message is returned, this message explains the steps that will be taken:

```json
{
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22T02:00:00+03:00",
  "meldefrist": "2022-06-30T12:00:00+03:00",
  "type": "forhandsutlysingtidlig",
  "ordreId": "20aa6a2e-685d-4271-9182-8f2c1518f99a",
  "forretningsforer": {
    "navn": "USBL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no"
  },
  "levert": "2022-07-07T18:42:51.3081344+03:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```

When the process is done this message is sent, summing up the result:

```json
{
  "antallInteressenter": 2, // This is a new field
  "varighetForkjopsrett": "2022-09-20T12:10:53+03:00", // This is a new field
  "utlysingssted": "Sendt styre, utlysing i laget",
  "utlysingsdato": "2022-06-22T02:00:00+03: 00",
  "meldefrist": "2022-06-30T12: 00: 00+03: 00",
  "type": "forhandsutlysingsen",
  "ordreId": "20aa6a2e-685d-4271-9182-8f2c1518f99a",
  "forretningsforer": {
    "navn": "USBL",
    "adresse": {
      "gateadresse": "Postboks 112 Lier",
      "postnummer": "0501",
      "poststed": "Oslo"
    },
    "epost": "post@kunde.no"
  },
  "levert": "2022-07-27T18:44:15.8474644+03:00",
  "referanse": "622/1",
  "eierform": "Seksjonseier"
}
```
