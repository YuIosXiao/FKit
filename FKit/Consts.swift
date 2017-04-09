//
//  Consts.swift
//  FKit
//
//  Created by 孔祥波 on 09/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation
public enum SFConnectionMode:String {
    case HTTP = "HTTP"
    case HTTPS = "HTTPS"
    case TCP = "TCP"
    //case CONNECT = "CONNECT"
    public var description: String {
        switch self {
        case .HTTP: return "HTTP"
        case .HTTPS: return "HTTPS"
        case .TCP: return "TCP"
            //case CONNECT: return "CONNECT"
        }
    }
    
}
public enum SFConnectionStatus :String{
    case Start = "Start"
    case Connectioning = "Connectioning"
    case Established = "Established"
    //    case Reading = "Reading"
    //    case Writing = "Writing"
    case Transferring = "Transferring"
    case RecvWaiting = "RecvWaiting"
    case SendWaiting = "SendWaiting"
    case Closing = "Closing"
    case Complete = "Complete"
    public var description: String {
        switch self {
        case .Start: return "Start"
        case .Connectioning: return "Connectioning"
        case .Established : return "Established"
            //        case Reading : return  "Reading"
        //        case Writing : return  "Writing"
        case .Transferring: return "Transferring"
        case .RecvWaiting: return "RecvWaiting"
        case .SendWaiting:return "SendWaiting"
        case .Closing: return "Closing"
        case .Complete: return "Complete"
        }
    }
}
public enum SFConnectionCompleteReason :Int{
    
    case noError = 0
    case badConfig = 1
    case badParam = 2
    case connectTimeout = 3
    case readTimeout = 4
    case writeTimeout = 5
    case readMaxedOut = 6
    case closedError = 7
    case otherError = 8
    
    case clientReject = 9
    case authFail = 10
    case idelTooLong = 11
    
    
    
    public var description: String {
        switch self {
        case .noError : return "No Error"
        case .badConfig: return "Bad Config"
        case .badParam: return "BadParam"
        case .connectTimeout: return "ConnectTimeout"
        case .readTimeout: return "Read Timeout"
        case .writeTimeout: return "Write Timeout"
        case .readMaxedOut: return "Read MaxedOut"
        case .closedError: return "remote closed"
        case .otherError: return "Other Error"
            
        case .clientReject: return "Reject"
        case .authFail: return "Auth Fail"
        case .idelTooLong: return "Idel Too Long"
        }
    }
}
public enum SOCKS5HostType:UInt8,CustomStringConvertible{
    case IPV4 = 0x01
    case DOMAIN = 0x03
    case IPV6 = 0x04
    public var description: String {
        switch self {
        case .IPV4 :return "SFSocks5HostTypeIPV4"
        case .DOMAIN: return "SFSocks5HostTypeDOMAIN"
        case .IPV6: return "SFSocks5HostTypeIPV6"
        }
    }
}
