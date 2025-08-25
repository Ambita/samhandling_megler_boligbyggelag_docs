

# SalgsmeldingMottatt

SalgsmeldingMottatt optional - clarifies process, can be omitted if no process is needed

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**ordreMottatt** | **String** |  |  |
|**harForkjopsrett** | **Boolean** |  |  |
|**forkjopsrett** | [**SalgsmeldingForkjopsrett**](SalgsmeldingForkjopsrett.md) |  |  [optional] |
|**styregodkjenningPakrevd** | **Boolean** |  |  |
|**styregodkjenning** | [**Styregodkjenning**](Styregodkjenning.md) |  |  [optional] |
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
| SALGSMELDINGMOTTATT | &quot;salgsmeldingmottatt&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



