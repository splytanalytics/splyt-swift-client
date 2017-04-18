//
// DataCollectorUpdateTransactionRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class DataCollectorUpdateTransactionRequest: JSONEncodable {
    /** The name/type of the transaction */
    public var category: String?
    /** Unique ID of the device triggering the event */
    public var deviceId: String?
    /** A key/value list of properties for this event. Values can be numerical, strings or booleans, proper typing matters (quoted vs unquoted) */
    public var eventProperties: AnyObject?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event itself occurred */
    public var eventTimestamp: Int64?
    /** Progress of the transaction, expressed as a percentage between 1 - 99 */
    public var progress: Int32?
    /** Specifies the canonical model name of the request. Ex: DataCollectorNewUserRequest , newUser, NewEventRequest , newEvent,e tc */
    public var requestType: String?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event was sent to the API */
    public var sendTimestamp: Int64?
    /** Unique transaction ID */
    public var transactionId: String?
    /** Unique ID of the user triggering the event */
    public var userId: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["category"] = self.category
        nillableDictionary["device_id"] = self.deviceId
        nillableDictionary["event_properties"] = self.eventProperties
        nillableDictionary["event_timestamp"] = self.eventTimestamp?.encodeToJSON()
        nillableDictionary["progress"] = self.progress?.encodeToJSON()
        nillableDictionary["request_type"] = self.requestType
        nillableDictionary["send_timestamp"] = self.sendTimestamp?.encodeToJSON()
        nillableDictionary["transaction_id"] = self.transactionId
        nillableDictionary["user_id"] = self.userId
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
