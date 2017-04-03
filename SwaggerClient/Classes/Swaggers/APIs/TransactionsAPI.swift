//
// TransactionsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class TransactionsAPI: APIBase {
    /**
     Begins a new transaction
     
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction initiation information (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func beginTransactionUsingPOST(customerId customerId: String, request: DataCollectorBeginTransactionRequest? = nil, completion: ((error: ErrorType?) -> Void)) {
        beginTransactionUsingPOSTWithRequestBuilder(customerId: customerId, request: request).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Begins a new transaction
     - POST /v2/transactions
     - Use the event properties to describe the initial state of the transaction
     
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction initiation information (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func beginTransactionUsingPOSTWithRequestBuilder(customerId customerId: String, request: DataCollectorBeginTransactionRequest? = nil) -> RequestBuilder<Void> {
        let path = "/v2/transactions"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = request?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Ends the transaction
     
     - parameter id: (path) Unique ID of the transaction being finalized 
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction finalization information (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func endTransactionUsingPUT(id id: String, customerId: String, request: DataCollectorEndTransactionRequest? = nil, completion: ((error: ErrorType?) -> Void)) {
        endTransactionUsingPUTWithRequestBuilder(id: id, customerId: customerId, request: request).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Ends the transaction
     - PUT /v2/transactions/{id}/end
     - Submits final transaction state to Knetik.io
     
     - parameter id: (path) Unique ID of the transaction being finalized 
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction finalization information (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func endTransactionUsingPUTWithRequestBuilder(id id: String, customerId: String, request: DataCollectorEndTransactionRequest? = nil) -> RequestBuilder<Void> {
        var path = "/v2/transactions/{id}/end"
        path = path.stringByReplacingOccurrencesOfString("{id}", withString: "\(id)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = request?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Creates and finalizes a collection of transaction information
     
     - parameter customerId: (query) customerId 
     - parameter request: (body) Collection state information (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func updateCollectionUsingPOST(customerId customerId: String, request: DataCollectorUpdateCollectionRequest? = nil, completion: ((error: ErrorType?) -> Void)) {
        updateCollectionUsingPOSTWithRequestBuilder(customerId: customerId, request: request).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Creates and finalizes a collection of transaction information
     - POST /v2/collections
     - This operation basically encapsulates beginTransaction and endTransaction semantics into a single step and is used to update user balance information in Knetik.io
     
     - parameter customerId: (query) customerId 
     - parameter request: (body) Collection state information (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func updateCollectionUsingPOSTWithRequestBuilder(customerId customerId: String, request: DataCollectorUpdateCollectionRequest? = nil) -> RequestBuilder<Void> {
        let path = "/v2/collections"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = request?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Updates the progress for the given transaction
     
     - parameter id: (path) Unique ID of the transaction being updated 
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction progress information (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func updateTransactionUsingPUT(id id: String, customerId: String, request: DataCollectorUpdateTransactionRequest? = nil, completion: ((error: ErrorType?) -> Void)) {
        updateTransactionUsingPUTWithRequestBuilder(id: id, customerId: customerId, request: request).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Updates the progress for the given transaction
     - PUT /v2/transactions/{id}
     - Use the event properties to update the state of the transaction
     
     - parameter id: (path) Unique ID of the transaction being updated 
     - parameter customerId: (query) customerId 
     - parameter request: (body) Transaction progress information (optional)

     - returns: RequestBuilder<Void> 
     */
    public class func updateTransactionUsingPUTWithRequestBuilder(id id: String, customerId: String, request: DataCollectorUpdateTransactionRequest? = nil) -> RequestBuilder<Void> {
        var path = "/v2/transactions/{id}"
        path = path.stringByReplacingOccurrencesOfString("{id}", withString: "\(id)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = request?.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

}
