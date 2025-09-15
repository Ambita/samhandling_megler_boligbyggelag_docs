# Total Common Costs / SumFelleskostnader

SumFelleskostnader is a standalone product that allows brokers to request the total common costs amount for a specific property. This is a simplified alternative to the full Boliginformasjon product when only common costs information is needed.

This message type can be ordered at any time and does not interfere with other product messages. It shares similarities with the Boliginformasjon product but is much simpler and focused solely on common costs information.

## Total common costs request (SumFelleskostnader)

On behalf of the broker the following request is made:

```json
{
  "type": "sumfelleskostnader",
  "ordreId": "2888e14e-1418-4d37-b3be-0d0b623681ba",
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

The SumFelleskostnader request uses the same basic structure as other product requests. For detailed field explanations see [common request fields](boliginformasjon.md#request-fields-that-are-in-all-requests).

The request contains only the basic required fields:
* type - Set to "sumfelleskostnader"
* All standard BasicProduct fields (ordreId, registerenhet, bestiller, meglerkontor, kontaktperson)

## Total common costs response (SumFelleskostnaderSvar)

The accountant responds with the total common costs amount for the specified property:

```json
{
  "type": "sumfelleskostnader",
  "ordreId": "2888e14e-1418-4d37-b3be-0d0b623681ba",
  "sumFelleskostnader": 2450.00,
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

* **sumFelleskostnader** (total common costs) - The total common costs amount in Norwegian kroner (NOK)
* **type** - Message type identifier ("sumfelleskostnader")
* **ordreId** - The order ID from the request
* **forretningsforer** (accountant) - Information about the accountant handling this property
* **klient** - Information about the property owner organization
* **levert** (delivered) - Timestamp when the response was created
* **referanse** (reference) - Accountant's internal reference
* **eierform** (ownership type) - Type of ownership (Andelseier, Seksjonseier, Aksjonær)

When our system receives this message, it will make the common costs information available to the broker system.

## Usage Notes

* This is an independent product that can be ordered at any time
* No special processing or approval workflows are involved
* The response provides only the common costs amount, not detailed cost breakdown
* Common costs typically include shared expenses like maintenance, utilities, insurance, and management fees
* For comprehensive property information including detailed cost information, use [Boliginformasjon](boliginformasjon.md) instead
* Production orders require using the `--profile ambitamain` option