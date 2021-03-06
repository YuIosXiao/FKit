//
//  SFVPNReport.swift
//  Surf
//
//  Created by yarshure on 16/3/7.
//  Copyright © 2016年 yarshure. All rights reserved.
//

import Foundation

import SwiftyJSON


open class SFVPNStatistics {
    public static let shared = SFVPNStatistics()
    public var startDate = Date()
    public var sessionStartTime = Date()
    public var reportTime = Date()
    public var startTimes = 0
    public var show:Bool = false
    public let totalTraffice:SFTraffic = SFTraffic()
    public let currentTraffice:SFTraffic = SFTraffic()
    public let lastTraffice:SFTraffic = SFTraffic()
    public let maxTraffice:SFTraffic = SFTraffic()
    
    public var wifiTraffice:SFTraffic = SFTraffic()
    public var cellTraffice:SFTraffic = SFTraffic()
    
    public var directTraffice:SFTraffic = SFTraffic()
    public var proxyTraffice:SFTraffic = SFTraffic()
    public var memoryUsed:UInt64 = 0
    public var finishedCount:Int = 0
    public var workingCount:Int = 0
    public var runing:String {
        get {
            let now = Date()
            let second = Int(now.timeIntervalSince(sessionStartTime))
            return secondToString(second: second)
        }
    }
    public func updateMax() {
        if lastTraffice.tx > maxTraffice.tx{
            maxTraffice.tx = lastTraffice.tx
        }
        if lastTraffice.rx > maxTraffice.rx {
            maxTraffice.rx = lastTraffice.rx
        }
    }
    public func secondToString(second:Int) ->String {
        
        let sec = second % 60
        let min = second % (60*60) / 60
        let hour = second / (60*60)
        
        return String.init(format: "%02d:%02d:%02d", hour,min,sec)
        

    }
    public func map(j:JSON) {
        startDate = Date.init(timeIntervalSince1970: j["start"].doubleValue) as Date
        sessionStartTime = Date.init(timeIntervalSince1970: j["sessionStartTime"].doubleValue)
        reportTime = NSDate.init(timeIntervalSince1970: j["report_date"].doubleValue) as Date
        totalTraffice.mapObject(j: j["total"])
        lastTraffice.mapObject(j: j["last"])
        maxTraffice.mapObject(j: j["max"])
        
        cellTraffice.mapObject(j:j["cell"])
        wifiTraffice.mapObject(j: j["wifi"])
        directTraffice.mapObject(j: j["direct"])
        proxyTraffice.mapObject(j: j["proxy"])
        if let c  = j["memory"].uInt64 {
            memoryUsed = c
        }
        if let tcp = j["finishedCount"].int {
            finishedCount = tcp
        }
        if let tcp = j["workingCount"].int {
            workingCount = tcp
        }
    }
    public func memoryString() ->String {
        let f = Float(memoryUsed)
        if memoryUsed < 1024 {
            return "\(memoryUsed) Bytes"
        }else if memoryUsed >=  1024 &&  memoryUsed <  1024*1024 {
            
            return  String(format: "%.2f KB", f/1024.0)
        }
        return String(format: "%.2f MB", f/1024.0/1024.0)
        
    }
    
}

