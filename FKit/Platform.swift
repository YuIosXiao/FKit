//
//  Platform.swift
//  FKit
//
//  Created by 孔祥波 on 09/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation

public func physicalMemory() ->Int{
    let memory = ProcessInfo.processInfo.physicalMemory
    let gb:UInt64 = 1024*1024*1024
    if memory < gb {
        return 1
    }else if memory > gb && memory < gb*2 {
        return 2
    }else if memory > 2*gb && memory < gb*3 {
        return 3
    }else if memory > 3*gb && memory < gb*4 {
        return 4
    }
    return 1
}
