---
title: "Feilmeldinger - Error Messages"
layout: default
---

# Errors / Feilmeldinger

## Allowable error codes

The following error codes are defined in `callbackTypes.ts` and can be used in the `feilkode` field:

| Error Code | Name | Description | Context |
|------------|------|-------------|----------|
| 1 | forhandsutlysingAlleredeOpprettet | Forhåndsutlysing already created | Occurs when attempting to create a pre-listing that already exists for the property |
| 2 | eierskifteAlleredeOpprettet | Ownership change already created | Occurs when attempting to create an ownership change that already exists |
| 4 | forhandsutlysningStottesIkke | Pre-listing not supported | The property or situation does not support pre-listing |
| 6 | tilknyttetAnnetBoligbyggelag | Connected to another housing cooperative | The property is handled by a different housing cooperative |
| 8 | tilknyttetAnnenForretningsforer | Connected to another property manager | The property is handled by a different property manager |
| 11 | eiendomIkkeFunnet | Property not found | Cannot find the property based on the provided ID |
| 12 | salgsmeldingOrdreIkkeFunnet | Sales notification order not found | Cannot make changes to a sales notification that doesn't exist |
| 31 | forhandIkkeUtloptSjekkStatus | Pre-listing not expired, check status | New order on same property from same broker while previous pre-listing is still active |
| 32 | forhandIkkeUtloptKontaktForrForer | Pre-listing not expired, contact property manager | New order on same property from different broker while previous pre-listing is still active |
| 33 | manuellBehandling | Manual processing required | Requires manual processing by the property manager |
| 34 | sakstypeForKlientIkkeFunnet | Case type for client not found | The case type for the specific client was not found |
| 35 | endringOverdragelseIKunngjoringsperioden | Transfer date change during announcement period not allowed | Cannot change transfer date during the announcement period |
| 39 | salgsmeldingKanIkkeLeveresDigital | Sales notification cannot be delivered digitally | Active manual pre-listing exists. Contact property manager! |

## Error fields

Here we include:

* feilkode (error code) - A predefined unique identifier for this error case
* feilmelding (error message) - A descriptive text explaining the error situation
* kansellert (cancelled) - A Boolean field indicating if this error cancels the whole order

## Example usage

Errors might happen. If we get into a situation where the responding system needs to send an error the following message may be used:

```json
{
  "tidspunkt": "2022-07-08T14:48:03.7753374Z",
  "kansellert": true,
  "feilmelding": "Forrige forhåndsutlysing-request har ikke utløpt ennå.",
  "feilkode": 33,
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
