

# ForhandsutlysingSen

ForhandsutlysingSen required - used to report announcement completed

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**ordreMottatt** | **String** |  |  |
|**utlysingssted** | **String** |  |  |
|**utlysingsdato** | **String** |  |  |
|**meldefrist** | **String** |  |  |
|**antallInteressenter** | **Integer** |  |  |
|**varighetForkjopsrett** | **String** |  |  |
|**ordreId** | **String** |  |  |
|**forretningsforer** | [**BasicResponseForretningsforer**](BasicResponseForretningsforer.md) |  |  |
|**klient** | [**Klient**](Klient.md) |  |  [optional] |
|**levert** | **String** |  |  [optional] |
|**referanse** | **String** |  |  [optional] |
|**eierform** | [**EierformEnum**](#EierformEnum) |  |  [optional] |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| FORHANDSUTLYSINGSEN | &quot;forhandsutlysingsen&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



