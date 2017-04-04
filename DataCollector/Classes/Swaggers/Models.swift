// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> AnyObject
}

public enum ErrorResponse : ErrorType {
    case Error(Int, NSData?, ErrorType)
}

public class Response<T> {
    public let statusCode: Int
    public let header: [String: String]
    public let body: T?

    public init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: NSHTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for (key, value) in rawHeader {
            header[key as! String] = value as? String
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

private var once = dispatch_once_t()
class Decoders {
    static private var decoders = Dictionary<String, ((AnyObject) -> AnyObject)>()

    static func addDecoder<T>(clazz clazz: T.Type, decoder: ((AnyObject) -> T)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0) as! AnyObject }
    }

    static func decode<T>(clazz clazz: [T].Type, source: AnyObject) -> [T] {
        let array = source as! [AnyObject]
        return array.map { Decoders.decode(clazz: T.self, source: $0) }
    }

    static func decode<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject) -> [Key:T] {
        let sourceDictionary = source as! [Key: AnyObject]
        var dictionary = [Key:T]()
        for (key, value) in sourceDictionary {
            dictionary[key] = Decoders.decode(clazz: T.self, source: value)
        }
        return dictionary
    }

    static func decode<T>(clazz clazz: T.Type, source: AnyObject) -> T {
        initialize()
        if T.self is Int32.Type && source is NSNumber {
            return source.intValue as! T;
        }
        if T.self is Int64.Type && source is NSNumber {
            return source.longLongValue as! T;
        }
        if T.self is NSUUID.Type && source is String {
            return NSUUID(UUIDString: source as! String) as! T
        }
        if source is T {
            return source as! T
        }
        if T.self is NSData.Type && source is String {
            return NSData(base64EncodedString: source as! String, options: NSDataBase64DecodingOptions()) as! T
        }

        let key = "\(T.self)"
        if let decoder = decoders[key] {
           return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decodeOptional<T>(clazz clazz: T.Type, source: AnyObject?) -> T? {
        if source is NSNull {
            return nil
        }
        return source.map { (source: AnyObject) -> T in
            Decoders.decode(clazz: clazz, source: source)
        }
    }

    static func decodeOptional<T>(clazz clazz: [T].Type, source: AnyObject?) -> [T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject?) -> [Key:T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [Key:T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static private func initialize() {
        dispatch_once(&once) {
            let formatters = [
                "yyyy-MM-dd",
                "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss'Z'",
                "yyyy-MM-dd'T'HH:mm:ss.SSS"
            ].map { (format: String) -> NSDateFormatter in
                let formatter = NSDateFormatter()
                formatter.dateFormat = format
                return formatter
            }
            // Decoder for NSDate
            Decoders.addDecoder(clazz: NSDate.self) { (source: AnyObject) -> NSDate in
               if let sourceString = source as? String {
                    for formatter in formatters {
                        if let date = formatter.dateFromString(sourceString) {
                            return date
                        }
                    }

                }
                if let sourceInt = source as? Int {
                    // treat as a java date
                    return NSDate(timeIntervalSince1970: Double(sourceInt / 1000) )
                }
                fatalError("formatter failed to parse \(source)")
            } 

            // Decoder for [DataCollectorBaseRequest]
            Decoders.addDecoder(clazz: [DataCollectorBaseRequest].self) { (source: AnyObject) -> [DataCollectorBaseRequest] in
                return Decoders.decode(clazz: [DataCollectorBaseRequest].self, source: source)
            }
            // Decoder for DataCollectorBaseRequest
            Decoders.addDecoder(clazz: DataCollectorBaseRequest.self) { (source: AnyObject) -> DataCollectorBaseRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorBaseRequest()
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorBatchRequest]
            Decoders.addDecoder(clazz: [DataCollectorBatchRequest].self) { (source: AnyObject) -> [DataCollectorBatchRequest] in
                return Decoders.decode(clazz: [DataCollectorBatchRequest].self, source: source)
            }
            // Decoder for DataCollectorBatchRequest
            Decoders.addDecoder(clazz: DataCollectorBatchRequest.self) { (source: AnyObject) -> DataCollectorBatchRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorBatchRequest()
                instance.batch = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["batch"])
                return instance
            }


            // Decoder for [DataCollectorBeginTransactionRequest]
            Decoders.addDecoder(clazz: [DataCollectorBeginTransactionRequest].self) { (source: AnyObject) -> [DataCollectorBeginTransactionRequest] in
                return Decoders.decode(clazz: [DataCollectorBeginTransactionRequest].self, source: source)
            }
            // Decoder for DataCollectorBeginTransactionRequest
            Decoders.addDecoder(clazz: DataCollectorBeginTransactionRequest.self) { (source: AnyObject) -> DataCollectorBeginTransactionRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorBeginTransactionRequest()
                instance.category = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["category"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.timeout = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["timeout"])
                instance.timeoutMode = DataCollectorBeginTransactionRequest.TimeoutMode(rawValue: (sourceDictionary["timeout_mode"] as? String) ?? "") 
                instance.transactionId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["transaction_id"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorEndTransactionRequest]
            Decoders.addDecoder(clazz: [DataCollectorEndTransactionRequest].self) { (source: AnyObject) -> [DataCollectorEndTransactionRequest] in
                return Decoders.decode(clazz: [DataCollectorEndTransactionRequest].self, source: source)
            }
            // Decoder for DataCollectorEndTransactionRequest
            Decoders.addDecoder(clazz: DataCollectorEndTransactionRequest.self) { (source: AnyObject) -> DataCollectorEndTransactionRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorEndTransactionRequest()
                instance.category = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["category"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.result = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["result"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.transactionId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["transaction_id"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorNewDeviceRequest]
            Decoders.addDecoder(clazz: [DataCollectorNewDeviceRequest].self) { (source: AnyObject) -> [DataCollectorNewDeviceRequest] in
                return Decoders.decode(clazz: [DataCollectorNewDeviceRequest].self, source: source)
            }
            // Decoder for DataCollectorNewDeviceRequest
            Decoders.addDecoder(clazz: DataCollectorNewDeviceRequest.self) { (source: AnyObject) -> DataCollectorNewDeviceRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorNewDeviceRequest()
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorNewUserRequest]
            Decoders.addDecoder(clazz: [DataCollectorNewUserRequest].self) { (source: AnyObject) -> [DataCollectorNewUserRequest] in
                return Decoders.decode(clazz: [DataCollectorNewUserRequest].self, source: source)
            }
            // Decoder for DataCollectorNewUserRequest
            Decoders.addDecoder(clazz: DataCollectorNewUserRequest.self) { (source: AnyObject) -> DataCollectorNewUserRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorNewUserRequest()
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorTuneRequest]
            Decoders.addDecoder(clazz: [DataCollectorTuneRequest].self) { (source: AnyObject) -> [DataCollectorTuneRequest] in
                return Decoders.decode(clazz: [DataCollectorTuneRequest].self, source: source)
            }
            // Decoder for DataCollectorTuneRequest
            Decoders.addDecoder(clazz: DataCollectorTuneRequest.self) { (source: AnyObject) -> DataCollectorTuneRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorTuneRequest()
                instance.campaignName = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["campaign_name"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorUpdateCollectionRequest]
            Decoders.addDecoder(clazz: [DataCollectorUpdateCollectionRequest].self) { (source: AnyObject) -> [DataCollectorUpdateCollectionRequest] in
                return Decoders.decode(clazz: [DataCollectorUpdateCollectionRequest].self, source: source)
            }
            // Decoder for DataCollectorUpdateCollectionRequest
            Decoders.addDecoder(clazz: DataCollectorUpdateCollectionRequest.self) { (source: AnyObject) -> DataCollectorUpdateCollectionRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorUpdateCollectionRequest()
                instance.balance = Decoders.decodeOptional(clazz: Double.self, source: sourceDictionary["balance"])
                instance.balanceModification = Decoders.decodeOptional(clazz: Double.self, source: sourceDictionary["balance_modification"])
                instance.currency = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["currency"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorUpdateDeviceStateRequest]
            Decoders.addDecoder(clazz: [DataCollectorUpdateDeviceStateRequest].self) { (source: AnyObject) -> [DataCollectorUpdateDeviceStateRequest] in
                return Decoders.decode(clazz: [DataCollectorUpdateDeviceStateRequest].self, source: source)
            }
            // Decoder for DataCollectorUpdateDeviceStateRequest
            Decoders.addDecoder(clazz: DataCollectorUpdateDeviceStateRequest.self) { (source: AnyObject) -> DataCollectorUpdateDeviceStateRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorUpdateDeviceStateRequest()
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorUpdateTransactionRequest]
            Decoders.addDecoder(clazz: [DataCollectorUpdateTransactionRequest].self) { (source: AnyObject) -> [DataCollectorUpdateTransactionRequest] in
                return Decoders.decode(clazz: [DataCollectorUpdateTransactionRequest].self, source: source)
            }
            // Decoder for DataCollectorUpdateTransactionRequest
            Decoders.addDecoder(clazz: DataCollectorUpdateTransactionRequest.self) { (source: AnyObject) -> DataCollectorUpdateTransactionRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorUpdateTransactionRequest()
                instance.category = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["category"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.progress = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["progress"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.transactionId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["transaction_id"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [DataCollectorUpdateUserStateRequest]
            Decoders.addDecoder(clazz: [DataCollectorUpdateUserStateRequest].self) { (source: AnyObject) -> [DataCollectorUpdateUserStateRequest] in
                return Decoders.decode(clazz: [DataCollectorUpdateUserStateRequest].self, source: source)
            }
            // Decoder for DataCollectorUpdateUserStateRequest
            Decoders.addDecoder(clazz: DataCollectorUpdateUserStateRequest.self) { (source: AnyObject) -> DataCollectorUpdateUserStateRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DataCollectorUpdateUserStateRequest()
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }


            // Decoder for [NewEventRequest]
            Decoders.addDecoder(clazz: [NewEventRequest].self) { (source: AnyObject) -> [NewEventRequest] in
                return Decoders.decode(clazz: [NewEventRequest].self, source: source)
            }
            // Decoder for NewEventRequest
            Decoders.addDecoder(clazz: NewEventRequest.self) { (source: AnyObject) -> NewEventRequest in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = NewEventRequest()
                instance.category = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["category"])
                instance.deviceId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["device_id"])
                instance.eventProperties = Decoders.decodeOptional(clazz: AnyObject.self, source: sourceDictionary["event_properties"])
                instance.eventTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["event_timestamp"])
                instance.requestType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["request_type"])
                instance.result = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["result"])
                instance.sendTimestamp = Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["send_timestamp"])
                instance.transactionId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["transaction_id"])
                instance.userId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["user_id"])
                return instance
            }
        }
    }
}
