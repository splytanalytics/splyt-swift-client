//
// DebuggingAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class DebuggingAPI: APIBase {
    /**
     Disable debugging via Redis
     
     - parameter customerId: (path) ID of the customer 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func disableDebugger(customerId customerId: String, completion: ((error: ErrorType?) -> Void)) {
        disableDebuggerWithRequestBuilder(customerId: customerId).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Disable debugging via Redis
     - DELETE /v2/_debug/{customerId}
     - Forces debugging to be disabled for the customer
     
     - parameter customerId: (path) ID of the customer 

     - returns: RequestBuilder<Void> 
     */
    public class func disableDebuggerWithRequestBuilder(customerId customerId: String) -> RequestBuilder<Void> {
        var path = "/v2/_debug/{customerId}"
        path = path.stringByReplacingOccurrencesOfString("{customerId}", withString: "\(customerId)", options: .LiteralSearch, range: nil)
        let URLString = DataCollectorAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = DataCollectorAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

    /**
     Enable debugging via Redis
     
     - parameter customerId: (path) ID of the customer 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func enableDebugger(customerId customerId: String, completion: ((error: ErrorType?) -> Void)) {
        enableDebuggerWithRequestBuilder(customerId: customerId).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Enable debugging via Redis
     - POST /v2/_debug/{customerId}
     - Debugging is only enabled for a limited period of time (default is one hour)
     
     - parameter customerId: (path) ID of the customer 

     - returns: RequestBuilder<Void> 
     */
    public class func enableDebuggerWithRequestBuilder(customerId customerId: String) -> RequestBuilder<Void> {
        var path = "/v2/_debug/{customerId}"
        path = path.stringByReplacingOccurrencesOfString("{customerId}", withString: "\(customerId)", options: .LiteralSearch, range: nil)
        let URLString = DataCollectorAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = DataCollectorAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

}
