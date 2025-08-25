# DefaultApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**boliginformasjonOrder**](DefaultApi.md#boliginformasjonOrder) | **POST** /boliginformasjon |  |
| [**boliginformasjonOrderWithHttpInfo**](DefaultApi.md#boliginformasjonOrderWithHttpInfo) | **POST** /boliginformasjon |  |
| [**callbackReceive**](DefaultApi.md#callbackReceive) | **POST** /callback |  |
| [**callbackReceiveWithHttpInfo**](DefaultApi.md#callbackReceiveWithHttpInfo) | **POST** /callback |  |
| [**endringKjopereOrder**](DefaultApi.md#endringKjopereOrder) | **POST** /endringkjopere |  |
| [**endringKjopereOrderWithHttpInfo**](DefaultApi.md#endringKjopereOrderWithHttpInfo) | **POST** /endringkjopere |  |
| [**endringOverdragelseOrder**](DefaultApi.md#endringOverdragelseOrder) | **POST** /endringoverdragelse |  |
| [**endringOverdragelseOrderWithHttpInfo**](DefaultApi.md#endringOverdragelseOrderWithHttpInfo) | **POST** /endringoverdragelse |  |
| [**forhandsutlysingOrder**](DefaultApi.md#forhandsutlysingOrder) | **POST** /forhandsutlysing |  |
| [**forhandsutlysingOrderWithHttpInfo**](DefaultApi.md#forhandsutlysingOrderWithHttpInfo) | **POST** /forhandsutlysing |  |
| [**restanseOrder**](DefaultApi.md#restanseOrder) | **POST** /restanse |  |
| [**restanseOrderWithHttpInfo**](DefaultApi.md#restanseOrderWithHttpInfo) | **POST** /restanse |  |
| [**salgsmeldingOrder**](DefaultApi.md#salgsmeldingOrder) | **POST** /salgsmelding |  |
| [**salgsmeldingOrderWithHttpInfo**](DefaultApi.md#salgsmeldingOrderWithHttpInfo) | **POST** /salgsmelding |  |
| [**sluttbrevOrder**](DefaultApi.md#sluttbrevOrder) | **POST** /sluttbrev |  |
| [**sluttbrevOrderWithHttpInfo**](DefaultApi.md#sluttbrevOrderWithHttpInfo) | **POST** /sluttbrev |  |
| [**sumFelleskostnaderOrder**](DefaultApi.md#sumFelleskostnaderOrder) | **POST** /sumfelleskostnader |  |
| [**sumFelleskostnaderOrderWithHttpInfo**](DefaultApi.md#sumFelleskostnaderOrderWithHttpInfo) | **POST** /sumfelleskostnader |  |
| [**sumGjeldOrder**](DefaultApi.md#sumGjeldOrder) | **POST** /sumgjeld |  |
| [**sumGjeldOrderWithHttpInfo**](DefaultApi.md#sumGjeldOrderWithHttpInfo) | **POST** /sumgjeld |  |



## boliginformasjonOrder

> void boliginformasjonOrder(boliginformasjonOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        BoliginformasjonOrdre boliginformasjonOrdre = new BoliginformasjonOrdre(); // BoliginformasjonOrdre | 
        try {
            apiInstance.boliginformasjonOrder(boliginformasjonOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#boliginformasjonOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **boliginformasjonOrdre** | [**BoliginformasjonOrdre**](BoliginformasjonOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## boliginformasjonOrderWithHttpInfo

> ApiResponse<Void> boliginformasjonOrder boliginformasjonOrderWithHttpInfo(boliginformasjonOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        BoliginformasjonOrdre boliginformasjonOrdre = new BoliginformasjonOrdre(); // BoliginformasjonOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.boliginformasjonOrderWithHttpInfo(boliginformasjonOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#boliginformasjonOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **boliginformasjonOrdre** | [**BoliginformasjonOrdre**](BoliginformasjonOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## callbackReceive

> void callbackReceive(callbackEvent)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        CallbackEvent callbackEvent = new CallbackEvent(); // CallbackEvent | 
        try {
            apiInstance.callbackReceive(callbackEvent);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#callbackReceive");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **callbackEvent** | [**CallbackEvent**](CallbackEvent.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## callbackReceiveWithHttpInfo

> ApiResponse<Void> callbackReceive callbackReceiveWithHttpInfo(callbackEvent)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        CallbackEvent callbackEvent = new CallbackEvent(); // CallbackEvent | 
        try {
            ApiResponse<Void> response = apiInstance.callbackReceiveWithHttpInfo(callbackEvent);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#callbackReceive");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **callbackEvent** | [**CallbackEvent**](CallbackEvent.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## endringKjopereOrder

> void endringKjopereOrder(endringKjopereOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        EndringKjopereOrdre endringKjopereOrdre = new EndringKjopereOrdre(); // EndringKjopereOrdre | 
        try {
            apiInstance.endringKjopereOrder(endringKjopereOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#endringKjopereOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **endringKjopereOrdre** | [**EndringKjopereOrdre**](EndringKjopereOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## endringKjopereOrderWithHttpInfo

> ApiResponse<Void> endringKjopereOrder endringKjopereOrderWithHttpInfo(endringKjopereOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        EndringKjopereOrdre endringKjopereOrdre = new EndringKjopereOrdre(); // EndringKjopereOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.endringKjopereOrderWithHttpInfo(endringKjopereOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#endringKjopereOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **endringKjopereOrdre** | [**EndringKjopereOrdre**](EndringKjopereOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## endringOverdragelseOrder

> void endringOverdragelseOrder(endringOverdragelseOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        EndringOverdragelseOrdre endringOverdragelseOrdre = new EndringOverdragelseOrdre(); // EndringOverdragelseOrdre | 
        try {
            apiInstance.endringOverdragelseOrder(endringOverdragelseOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#endringOverdragelseOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **endringOverdragelseOrdre** | [**EndringOverdragelseOrdre**](EndringOverdragelseOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## endringOverdragelseOrderWithHttpInfo

> ApiResponse<Void> endringOverdragelseOrder endringOverdragelseOrderWithHttpInfo(endringOverdragelseOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        EndringOverdragelseOrdre endringOverdragelseOrdre = new EndringOverdragelseOrdre(); // EndringOverdragelseOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.endringOverdragelseOrderWithHttpInfo(endringOverdragelseOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#endringOverdragelseOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **endringOverdragelseOrdre** | [**EndringOverdragelseOrdre**](EndringOverdragelseOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## forhandsutlysingOrder

> void forhandsutlysingOrder(forhandsutlysingOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        ForhandsutlysingOrdre forhandsutlysingOrdre = new ForhandsutlysingOrdre(); // ForhandsutlysingOrdre | 
        try {
            apiInstance.forhandsutlysingOrder(forhandsutlysingOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#forhandsutlysingOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **forhandsutlysingOrdre** | [**ForhandsutlysingOrdre**](ForhandsutlysingOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## forhandsutlysingOrderWithHttpInfo

> ApiResponse<Void> forhandsutlysingOrder forhandsutlysingOrderWithHttpInfo(forhandsutlysingOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        ForhandsutlysingOrdre forhandsutlysingOrdre = new ForhandsutlysingOrdre(); // ForhandsutlysingOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.forhandsutlysingOrderWithHttpInfo(forhandsutlysingOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#forhandsutlysingOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **forhandsutlysingOrdre** | [**ForhandsutlysingOrdre**](ForhandsutlysingOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## restanseOrder

> void restanseOrder(restanseOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        RestanseOrdre restanseOrdre = new RestanseOrdre(); // RestanseOrdre | 
        try {
            apiInstance.restanseOrder(restanseOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#restanseOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **restanseOrdre** | [**RestanseOrdre**](RestanseOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## restanseOrderWithHttpInfo

> ApiResponse<Void> restanseOrder restanseOrderWithHttpInfo(restanseOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        RestanseOrdre restanseOrdre = new RestanseOrdre(); // RestanseOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.restanseOrderWithHttpInfo(restanseOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#restanseOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **restanseOrdre** | [**RestanseOrdre**](RestanseOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## salgsmeldingOrder

> void salgsmeldingOrder(salgsmeldingOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SalgsmeldingOrdre salgsmeldingOrdre = new SalgsmeldingOrdre(); // SalgsmeldingOrdre | 
        try {
            apiInstance.salgsmeldingOrder(salgsmeldingOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#salgsmeldingOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **salgsmeldingOrdre** | [**SalgsmeldingOrdre**](SalgsmeldingOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## salgsmeldingOrderWithHttpInfo

> ApiResponse<Void> salgsmeldingOrder salgsmeldingOrderWithHttpInfo(salgsmeldingOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SalgsmeldingOrdre salgsmeldingOrdre = new SalgsmeldingOrdre(); // SalgsmeldingOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.salgsmeldingOrderWithHttpInfo(salgsmeldingOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#salgsmeldingOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **salgsmeldingOrdre** | [**SalgsmeldingOrdre**](SalgsmeldingOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## sluttbrevOrder

> void sluttbrevOrder(sluttbrevOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SluttbrevOrdre sluttbrevOrdre = new SluttbrevOrdre(); // SluttbrevOrdre | 
        try {
            apiInstance.sluttbrevOrder(sluttbrevOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sluttbrevOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sluttbrevOrdre** | [**SluttbrevOrdre**](SluttbrevOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## sluttbrevOrderWithHttpInfo

> ApiResponse<Void> sluttbrevOrder sluttbrevOrderWithHttpInfo(sluttbrevOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SluttbrevOrdre sluttbrevOrdre = new SluttbrevOrdre(); // SluttbrevOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.sluttbrevOrderWithHttpInfo(sluttbrevOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sluttbrevOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sluttbrevOrdre** | [**SluttbrevOrdre**](SluttbrevOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## sumFelleskostnaderOrder

> void sumFelleskostnaderOrder(sumFelleskostnaderOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SumFelleskostnaderOrdre sumFelleskostnaderOrdre = new SumFelleskostnaderOrdre(); // SumFelleskostnaderOrdre | 
        try {
            apiInstance.sumFelleskostnaderOrder(sumFelleskostnaderOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sumFelleskostnaderOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sumFelleskostnaderOrdre** | [**SumFelleskostnaderOrdre**](SumFelleskostnaderOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## sumFelleskostnaderOrderWithHttpInfo

> ApiResponse<Void> sumFelleskostnaderOrder sumFelleskostnaderOrderWithHttpInfo(sumFelleskostnaderOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SumFelleskostnaderOrdre sumFelleskostnaderOrdre = new SumFelleskostnaderOrdre(); // SumFelleskostnaderOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.sumFelleskostnaderOrderWithHttpInfo(sumFelleskostnaderOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sumFelleskostnaderOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sumFelleskostnaderOrdre** | [**SumFelleskostnaderOrdre**](SumFelleskostnaderOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |


## sumGjeldOrder

> void sumGjeldOrder(sumGjeldOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SumGjeldOrdre sumGjeldOrdre = new SumGjeldOrdre(); // SumGjeldOrdre | 
        try {
            apiInstance.sumGjeldOrder(sumGjeldOrdre);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sumGjeldOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getResponseBody());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sumGjeldOrdre** | [**SumGjeldOrdre**](SumGjeldOrdre.md)|  | |

### Return type


null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

## sumGjeldOrderWithHttpInfo

> ApiResponse<Void> sumGjeldOrder sumGjeldOrderWithHttpInfo(sumGjeldOrdre)



### Example

```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.ApiResponse;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.DefaultApi;

public class Example {
    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        defaultClient.setBasePath("http://localhost");

        DefaultApi apiInstance = new DefaultApi(defaultClient);
        SumGjeldOrdre sumGjeldOrdre = new SumGjeldOrdre(); // SumGjeldOrdre | 
        try {
            ApiResponse<Void> response = apiInstance.sumGjeldOrderWithHttpInfo(sumGjeldOrdre);
            System.out.println("Status code: " + response.getStatusCode());
            System.out.println("Response headers: " + response.getHeaders());
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#sumGjeldOrder");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Response headers: " + e.getResponseHeaders());
            System.err.println("Reason: " + e.getResponseBody());
            e.printStackTrace();
        }
    }
}
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **sumGjeldOrdre** | [**SumGjeldOrdre**](SumGjeldOrdre.md)|  | |

### Return type


ApiResponse<Void>

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The request has succeeded. |  -  |

