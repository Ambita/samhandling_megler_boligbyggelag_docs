---
title: "Feilmeldinger - Error Messages"
layout: default
---

<div class="language-content lang-en" markdown="1">

# Errors

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

</div>

<div class="language-content lang-no" lang="no" markdown="1">

# Feilmeldinger

## Gyldige feilkoder

Følgende feilkoder er definert i `callbackTypes.ts` og kan brukes i feltet `feilkode`:

| Feilkode | Navn | Beskrivelse | Kontekst |
|----------|------|-------------|----------|
| 1 | forhandsutlysingAlleredeOpprettet | Forhåndsutlysing er allerede opprettet | Oppstår når en ny forhåndsutlysing forsøkes opprettet for samme eiendom |
| 2 | eierskifteAlleredeOpprettet | Eierskifte er allerede opprettet | Oppstår når et eierskifte som allerede finnes forsøkes opprettet på nytt |
| 4 | forhandsutlysningStottesIkke | Forhåndsutlysing støttes ikke | Eiendommen eller situasjonen støtter ikke forhåndsutlysing |
| 6 | tilknyttetAnnetBoligbyggelag | Tilknyttet et annet boligbyggelag | Eiendommen forvaltes av et annet boligbyggelag |
| 8 | tilknyttetAnnenForretningsforer | Tilknyttet en annen forretningsfører | Eiendommen håndteres av en annen forretningsfører |
| 11 | eiendomIkkeFunnet | Eiendom ikke funnet | Fant ikke eiendommen basert på oppgitt ID |
| 12 | salgsmeldingOrdreIkkeFunnet | Salgsmelding-ordre ikke funnet | Kan ikke endre en salgsmelding som ikke eksisterer |
| 31 | forhandIkkeUtloptSjekkStatus | Forhåndsutlysing er ikke utløpt, sjekk status | Ny bestilling fra samme megler mens forrige forhåndsutlysing fortsatt er aktiv |
| 32 | forhandIkkeUtloptKontaktForrForer | Forhåndsutlysing er ikke utløpt, kontakt forretningsfører | Ny bestilling fra annen megler mens forrige forhåndsutlysing fortsatt er aktiv |
| 33 | manuellBehandling | Manuell behandling kreves | Saken må håndteres manuelt av forretningsfører |
| 34 | sakstypeForKlientIkkeFunnet | Sakstype for klient ikke funnet | Relevant sakstype for oppgitt klient finnes ikke |
| 35 | endringOverdragelseIKunngjoringsperioden | Datoendring ikke tillatt i kunngjøringsperioden | Overdragelsesdato kan ikke endres mens kunngjøring pågår |
| 39 | salgsmeldingKanIkkeLeveresDigital | Salgsmelding kan ikke leveres digitalt | Det finnes en aktiv manuell forhåndsutlysing. Kontakt forretningsfører! |

## Felter i feilmeldingen

Disse feltene inngår i feilmeldingen:

* feilkode – unik identifikator for feilsituasjonen
* feilmelding – tekstlig beskrivelse som forklarer feilen
* kansellert – sann/usann som viser om hele ordren kanselleres

## Eksempel

Feil kan oppstå. Dersom systemet som svarer må sende en feil, kan meldingen se slik ut:

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

</div>
