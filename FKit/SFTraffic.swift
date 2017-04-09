//
//  SFTraffic.swift
//  FKit
//
//  Created by 孔祥波 on 09/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation

import SwiftyJSON

public class SFTraffic {
    public var rx: UInt = 0
    public var tx: UInt = 0
    public init(){
        
    }
    public func addRx(x:Int){
        rx += UInt(x)
    }
    public func addTx(x:Int){
        tx += UInt(x)
    }
    public func reset() {
        rx = 0
        tx = 0
    }
    public func txString() ->String{
        return toString(x: tx,label: "TX:",speed: false)
    }
    public func rxString() ->String {
        return toString(x: rx,label:"RX:",speed: false)
    }
    public func toString(x:UInt,label:String,speed:Bool) ->String {
        
        var s = "/s"
        if !speed {
            s = ""
        }
        #if os(macOS)
            if x < 1024{
                return label + " \(x) B" + s
            }else if x >= 1024 && x < 1024*1024 {
                return label +  String(format: "%d KB", Int(Float(x)/1024.0))  + s
            }else if x >= 1024*1024 && x < 1024*1024*1024 {
                //return label + "\(x/1024/1024) MB" + s
                return label +  String(format: "%d MB", Int(Float(x)/1024/1024))  + s
            }else {
                //return label + "\(x/1024/1024/1024) GB" + s
                return label +  String(format: "%d GB", Int(Float(x)/1024/1024/1024))  + s
            }
        #else
            if x < 1024{
                return label + " \(x) B" + s
            }else if x >= 1024 && x < 1024*1024 {
                return label +  String(format: "%.2f KB", Float(x)/1024.0)  + s
            }else if x >= 1024*1024 && x < 1024*1024*1024 {
                //return label + "\(x/1024/1024) MB" + s
                return label +  String(format: "%.2f MB", Float(x)/1024/1024)  + s
            }else {
                //return label + "\(x/1024/1024/1024) GB" + s
                return label +  String(format: "%.2f GB", Float(x)/1024/1024/1024)  + s
            }
        #endif
    }
    public func report() ->String{
        return "\(toString(x: tx, label: "TX:",speed: true)) \(toString(x: rx, label: "RX:",speed: true))"
    }
    public func reportTraffic() ->String{
        return "\(toString(x: tx, label: "TX:",speed: false)) \(toString(x: rx, label: "RX:",speed: false))"
    }
    public func resp ()-> [String:NSNumber] {
        return ["rx":NSNumber.init(value: rx) ,"tx":NSNumber.init(value: tx)]
    }
    public func mapObject(j:JSON)  {
        rx = UInt(j["rx"].int64Value)
        tx = UInt(j["tx"].int64Value)
    }
}
