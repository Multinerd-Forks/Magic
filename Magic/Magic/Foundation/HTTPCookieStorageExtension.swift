//
//  HTTPCookieStorageExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension HTTPCookieStorage {
    func saveCookie() {
        var cookieData = [Any]()
        let cookieStorage = HTTPCookieStorage.shared
        for cookie: HTTPCookie in cookieStorage.cookies! {
            var cookieDictionary = [AnyHashable: Any]()
            cookieDictionary[HTTPCookiePropertyKey.name] = cookie.name
            cookieDictionary[HTTPCookiePropertyKey.value] = cookie.value
            cookieDictionary[HTTPCookiePropertyKey.domain] = cookie.domain
            cookieDictionary[HTTPCookiePropertyKey.path] = cookie.path
            cookieDictionary[HTTPCookiePropertyKey.secure] = (cookie.isSecure ? "YES" : "NO")
            cookieDictionary[HTTPCookiePropertyKey.version] = "\(cookie.version)"
            if (cookie.expiresDate != nil) {
                cookieDictionary[HTTPCookiePropertyKey.expires] = cookie.expiresDate
            }
            cookieData.append(cookieDictionary)
        }
        // TODO:
//        cookieData.write(toFile: self.storagePath(), atomically: true)
    }
    
    func loadCookie() {
//        var cookies = [Any](contentsOfFile: self.storagePath())
//        var cookieStorage = HTTPCookieStorage.shared
//        for cookieData: [AnyHashable: Any] in cookies {
//            cookieStorage.setCookie(HTTPCookie.withProperties(cookieData))
//        }
    }
    
    fileprivate func storagePath() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return "\(paths[0])/Cookies.data"
    }
}
