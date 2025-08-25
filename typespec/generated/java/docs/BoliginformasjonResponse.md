

# BoliginformasjonResponse

Boliginformasjon required - used to report information on requested property

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
|**forkjopsrett** | [**Object**](Object.md) |  |  |
|**styregodkjenning** | [**Object**](Object.md) |  |  |
|**salgsmelding** | [**Object**](Object.md) |  |  |
|**restanse** | [**Object**](Object.md) |  |  |
|**andreHensyn** | **String** |  |  [optional] |
|**ordreId** | **String** |  |  |
|**forretningsforer** | [**BasicResponseForretningsforer**](BasicResponseForretningsforer.md) |  |  |
|**klient** | [**Klient**](Klient.md) |  |  [optional] |
|**levert** | **String** |  |  [optional] |
|**referanse** | **String** |  |  [optional] |
|**eierform** | [**EierformEnum**](#EierformEnum) |  |  [optional] |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| BOLIGINFORMASJON | &quot;boliginformasjon&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



