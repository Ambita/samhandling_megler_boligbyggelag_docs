

# EndringKjopereFullfort

EierskifteFullfort required - confirms process completed

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**ordreMottatt** | **String** |  |  |
|**styregodkjenningPakrevd** | **Boolean** |  |  |
|**styregodkjenning** | [**StyregodkjenningFullfort**](StyregodkjenningFullfort.md) |  |  [optional] |
|**ordreId** | **String** |  |  |
|**forretningsforer** | [**BasicResponseForretningsforer**](BasicResponseForretningsforer.md) |  |  |
|**klient** | [**Klient**](Klient.md) |  |  [optional] |
|**levert** | **String** |  |  [optional] |
|**referanse** | **String** |  |  [optional] |
|**eierform** | [**EierformEnum**](#EierformEnum) |  |  [optional] |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| ENDRINGKJOPEREFULLFORT | &quot;endringkjoperefullfort&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



