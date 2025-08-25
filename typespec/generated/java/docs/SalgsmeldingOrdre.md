

# SalgsmeldingOrdre

Salgsmelding Trigger the change of ownership

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**kjopere** | [**List&lt;Kontakt&gt;**](Kontakt.md) |  |  |
|**selgere** | [**List&lt;Kontakt&gt;**](Kontakt.md) |  |  |
|**eiere** | [**List&lt;Kontakt&gt;**](Kontakt.md) |  |  [optional] |
|**omsetningstype** | [**OmsetningstypeEnum**](#OmsetningstypeEnum) |  |  [optional] |
|**finnkode** | **String** |  |  [optional] |
|**salg** | [**Salg**](Salg.md) |  |  |
|**bolig** | [**Bolig**](Bolig.md) |  |  |
|**ordreId** | **String** |  |  |
|**estateId** | **String** |  |  [optional] |
|**oppdragsnummer** | **String** |  |  [optional] |
|**registerenhet** | [**Registerenhet**](Registerenhet.md) |  |  |
|**bestiller** | [**Kontaktinfo**](Kontaktinfo.md) |  |  |
|**meglerkontor** | [**Meglerkontor**](Meglerkontor.md) |  |  |
|**kontaktperson** | [**Kontaktinfo**](Kontaktinfo.md) |  |  |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| SALGSMELDING | &quot;salgsmelding&quot; |



## Enum: OmsetningstypeEnum

| Name | Value |
|---- | -----|
| SALG | &quot;salg&quot; |
| TVANGSSALG | &quot;tvangssalg&quot; |
| UTLEIE | &quot;utleie&quot; |
| VERDIVURDERING | &quot;verdivurdering&quot; |
| OPPGJORSOPPDRAG | &quot;oppgjorsoppdrag&quot; |



