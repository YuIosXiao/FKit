//
//  FKit.swift
//  FKit
//
//  Created by 孔祥波 on 08/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation
let  fm = FileManager.default
public class FKit {
    static var groupIdentifier = ""
    static var kProxyGroupFile = ""
    
    static func  groupContainerURL() ->URL{
        
        return fm.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)!
        
        
        //#endif
        //return URL.init(fileURLWithPath: "")
        
    }
    static var LimitSpeedSimgl:UInt = 0
    static func settingURL() ->URL {
        return self.groupContainerURL().appendingPathComponent(kProxyGroupFile)
    }
    static public func setup(_ groupIden:String,proxyGroupFile:String){
        self.groupIdentifier = groupIden
        self.kProxyGroupFile = proxyGroupFile
    }
}
