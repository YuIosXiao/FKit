//
//  util.swift
//  FKit
//
//  Created by 孔祥波 on 09/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation
public func copyFile(_ src:URL,dst:URL,forceCopy:Bool) throws{
    let spath = src.path
    let dpath = dst.path
    if fm.fileExists(atPath: dpath)   {
        
        if forceCopy{
            do {
                try fm.removeItem(atPath: dpath)
                
            }catch let error as NSError{
                throw error
            }
            
            do {
                try fm.copyItem(atPath: spath, toPath: dpath)
            }catch let error as NSError{
                throw error
            }
        }
        
    }else {
        do {
            try fm.copyItem(atPath: spath, toPath: dpath)
        }catch let error as NSError{
            throw error
        }
    }
    
}
func checkJB() ->Bool{
    return fm.fileExists(atPath: "/private/var/lib/apt/")
    // NSFileManager * fileManager = [NSFileManager defaultManager];
    // return [fileManager fileExists(atPath::@"/private/var/lib/apt/"];
    //}
}


public func appInfo() -> [String:String]{
    var result = [String:String]()
    if let info = Bundle.main.infoDictionary, let appVersion =  info["CFBundleShortVersionString"] as? String,let buildVersion =  info["CFBundleVersion"] as? String {
        result["appVersion"] =  appVersion
        result["buildVersion"] = buildVersion
        
    }
    #if os(iOS)
        result["mode"] = UIDevice.current.model
        result["platform"] = ""// hwVersion()
    #endif
    result["memory"] = "\(physicalMemory())G"
    result["iOS"] = ProcessInfo.processInfo.operatingSystemVersionString
    if checkJB(){
        result["jb"] = "yes"
    }else {
        result["jb"] = "no"
    }
    
    return result
}
public func appVersion() -> String{
    if let info = Bundle.main.infoDictionary, let appVersion =  info["CFBundleShortVersionString"] as? String{
        return appVersion
    }
    return ""
}
public func appBuild() -> String{
    if let info = Bundle.main.infoDictionary, let buildVersion =  info["CFBundleVersion"] as? String{
        return buildVersion
    }
    return ""
}
public func mylog<T>(_ object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    //let fn = file.split { $0 == "/" }.last
    let fn = file.characters.split { $0 == "/" }.map(String.init).last
    if let f = fn {
        let info = "\(f) \(function)[\(line)]:\(object)"
        NSLog(info)
        //debugPrint(info)
        //print(info,errStream)
        //print()
        //print(info, StderrStream.shared)
    }else {
        let info = "\(file) [\(line)]:\(object)"
        //debugPrint(info)
        NSLog(info)
        //print(info,errStream)
        //print(info, toStream: &StderrStream.shared)
    }
    //    let info = "\(function):\(object)"
    //    NSLog(info)
}
