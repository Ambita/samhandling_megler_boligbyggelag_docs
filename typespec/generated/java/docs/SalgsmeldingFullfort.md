

# SalgsmeldingFullfort

SalgsmeldingFullfort required - expected at the end of the process - marks sale process completed

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**ordreMottatt** | **String** |  |  |
|**harForkjopsrett** | **Boolean** |  |  |
|**forkjopsrett** | [**SalgsmeldingForkjopsrettFullfort**](SalgsmeldingForkjopsrettFullfort.md) |  |  [optional] |
|**styregodkjenningPakrevd** | **Boolean** |  |  |
|**styregodkjenning** | [**StyregodkjenningFullfort**](StyregodkjenningFullfort.md) |  |  [optional] |
|**kjopere** | [**List&lt;Kontakt&gt;**](Kontakt.md) |  |  |
|**tilknyttetLag** | **Boolean** |  |  |
|**ordreId** | **String** |  |  |
|**forretningsforer** | [**BasicResponseForretningsforer**](BasicResponseForretningsforer.md) |  |  |
|**klient** | [**Klient**](Klient.md) |  |  [optional] |
|**levert** | **String** |  |  [optional] |
|**referanse** | **String** |  |  [optional] |
|**eierform** | [**EierformEnum**](#EierformEnum) |  |  [optional] |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| SALGSMELDINGFULLFORT | &quot;salgsmeldingfullfort&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



