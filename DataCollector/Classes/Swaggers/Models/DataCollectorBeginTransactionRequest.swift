//
// DataCollectorBeginTransactionRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class DataCollectorBeginTransactionRequest: JSONEncodable {
    public enum TimeoutMode: String { 
        case Txn = "TXN"
        case Any = "ANY"
    }
    /** The name/type of the transaction */
    public var category: String?
    /** Unique ID of the device triggering the event */
    public var deviceId: String?
    /** A key/value list of properties for this event. Values can be numerical, strings or booleans, proper typing matters (quoted vs unquoted) */
    public var eventProperties: AnyObject?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event itself occurred */
    public var eventTimestamp: Int64?
    /** Specifies the canonical model name of the request. Ex: DataCollectorNewUserRequest -&gt; newUser, NewEventRequest -&gt; newEvent,e tc */
    public var requestType: String?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event was sent to the API */
    public var sendTimestamp: Int64?
    /** Timeout (in seconds) for the transaction */
    public var timeout: Int32?
    /** Timeout mode for the transaction. With TXN, the timeout is reset when an update is posted to the same transaction. With ANY, the timeout is reset when an update is posted for any transaction w/ the same user/device */
    public var timeoutMode: TimeoutMode?
    /** Unique transaction ID */
    public var transactionId: String?
    /** Unique ID of the user triggering the event */
    public var userId: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["category"] = self.category
        nillableDictionary["deviceId"] = self.deviceId
        nillableDictionary["eventProperties"] = self.eventProperties
        nillableDictionary["eventTimestamp"] = self.eventTimestamp?.encodeToJSON()
        nillableDictionary["requestType"] = self.requestType
        nillableDictionary["sendTimestamp"] = self.sendTimestamp?.encodeToJSON()
        nillableDictionary["timeout"] = self.timeout?.encodeToJSON()
        nillableDictionary["timeoutMode"] = self.timeoutMode?.rawValue
        nillableDictionary["transactionId"] = self.transactionId
        nillableDictionary["userId"] = self.userId
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
