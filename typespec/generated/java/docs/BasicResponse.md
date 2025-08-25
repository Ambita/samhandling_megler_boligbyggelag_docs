

# BasicResponse


## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**type** | [**TypeEnum**](#TypeEnum) |  |  |
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
| FORHANDSUTLYSINGTIDLIG | &quot;forhandsutlysingtidlig&quot; |
| FORHANDSUTLYSINGUTSATT | &quot;forhandsutlysingutsatt&quot; |
| FORHANDSUTLYSINGSEN | &quot;forhandsutlysingsen&quot; |
| FORHANDSUTLYSINGUTLOPT | &quot;forhandsutlysingutlopt&quot; |
| SALGSMELDINGMOTTATT | &quot;salgsmeldingmottatt&quot; |
| SALGSMELDINGOPPDATERING | &quot;salgsmeldingoppdatering&quot; |
| SALGSMELDINGFULLFORT | &quot;salgsmeldingfullfort&quot; |
| ENDRINGOVERDRAGELSE | &quot;endringoverdragelse&quot; |
| ENDRINGKJOPEREMOTTATT | &quot;endringkjoperemottatt&quot; |
| ENDRINGKJOPEREFULLFORT | &quot;endringkjoperefullfort&quot; |
| SLUTTBREVAKSEPTERT | &quot;sluttbrevakseptert&quot; |
| SUMGJELD | &quot;sumgjeld&quot; |
| SUMFELLESKOSTNADER | &quot;sumfelleskostnader&quot; |
| FEIL | &quot;feil&quot; |



## Enum: EierformEnum

| Name | Value |
|---- | -----|
| AKSJON_R | &quot;Aksjonår&quot; |
| ANDELSEIER | &quot;Andelseier&quot; |
| SAMEIER | &quot;Sameier&quot; |
| SEKSJONSEIER | &quot;Seksjonseier&quot; |



