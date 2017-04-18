//
// DataCollectorUpdateCollectionRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class DataCollectorUpdateCollectionRequest: JSONEncodable {
    /** Final balance after the transaction */
    public var balance: Double?
    /** The amount changed (delta) in the transaction */
    public var balanceModification: Double?
    /** Whether the unit being updated is a currency unit or not */
    public var currency: Bool?
    /** Unique ID of the device triggering the event */
    public var deviceId: String?
    /** A key/value list of properties for this event. Values can be numerical, strings or booleans, proper typing matters (quoted vs unquoted) */
    public var eventProperties: AnyObject?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event itself occurred */
    public var eventTimestamp: Int64?
    /** Name of the unit/collection/currency being updated */
    public var name: String?
    /** Specifies the canonical model name of the request. Ex: DataCollectorNewUserRequest , newUser, NewEventRequest , newEvent,e tc */
    public var requestType: String?
    /** Epoch timestamp &lt;i&gt;in milliseconds&lt;/i&gt; of when event was sent to the API */
    public var sendTimestamp: Int64?
    /** Unique ID of the new device */
    public var userId: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["balance"] = self.balance
        nillableDictionary["balance_modification"] = self.balanceModification
        nillableDictionary["currency"] = self.currency
        nillableDictionary["device_id"] = self.deviceId
        nillableDictionary["event_properties"] = self.eventProperties
        nillableDictionary["event_timestamp"] = self.eventTimestamp?.encodeToJSON()
        nillableDictionary["name"] = self.name
        nillableDictionary["request_type"] = self.requestType
        nillableDictionary["send_timestamp"] = self.sendTimestamp?.encodeToJSON()
        nillableDictionary["user_id"] = self.userId
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
