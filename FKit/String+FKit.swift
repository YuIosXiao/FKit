//
//  String+FKit.swift
//  FKit
//
//  Created by 孔祥波 on 09/04/2017.
//  Copyright © 2017 Kong XiangBo. All rights reserved.
//

import Foundation
public extension String {
    public func to(index:Int) ->String{
        return self.substring(to: self.index(self.startIndex, offsetBy: index))
    }
    public func validateIpAddr() ->SOCKS5HostType{
        var sin = sockaddr_in()
        var sin6 = sockaddr_in6()
        
        if self.withCString({ cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) }) == 1 {
            // IPv6 peer.
            return .IPV6
        }
        else if self.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1 {
            // IPv4 peer.
            return .IPV4
        }
        
        return .DOMAIN
        
    }
}
