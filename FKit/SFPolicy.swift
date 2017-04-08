//
//  SFPolicy.swift
//  FKit
//
//  Created by 孔祥波 on 08/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation
public enum SFPolicy :String{
    case Direct = "DIRECT"
    case Reject = "REJECT"
    case Proxy = "Proxy"
    case Random =  "RANDOM"
    public var description: String {
        switch self {
        case .Direct: return "DIRECT"
        case .Reject: return "REJECT"
        case .Proxy: return "Proxy"
        case .Random: return "RANDOM"
        }
    }
}
