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
    "epost": "tbf@domene.no" 
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