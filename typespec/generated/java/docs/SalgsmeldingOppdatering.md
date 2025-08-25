

# SalgsmeldingOppdatering

SalgsmeldingOppdatering optional - can be sent before board approval process completed

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**ordreMottatt** | **String** |  |  |
|**harForkjopsrett** | **Boolean** |  |  |
|**forkjopsrett** | [**SalgsmeldingForkjopsrettFullfort**](SalgsmeldingForkjopsrettFullfort.md) |  |  [optional] |
|**styregodkjenningPakrevd** | **Boolean** |  |  |
|**styregodkjenning** | [**Styregodkjenning**](Styregodkjenning.md) |  |  [optional] |
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
| SALGSMELDINGOPPDATERING | &quot;salgsmeldingoppdatering&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



