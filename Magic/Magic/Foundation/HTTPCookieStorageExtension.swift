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
        var cookies = [[HTTPCookiePropertyKey: Any]]()
        let cookieStorage = HTTPCookieStorage.shared
        for cookie: HTTPCookie in cookieStorage.cookies! {
            var cookieDictionary = [HTTPCookiePropertyKey: Any]()
            cookieDictionary[HTTPCookiePropertyKey.name] = cookie.name
            cookieDictionary[HTTPCookiePropertyKey.value] = cookie.value
            cookieDictionary[HTTPCookiePropertyKey.domain] = cookie.domain
            cookieDictionary[HTTPCookiePropertyKey.path] = cookie.path
            cookieDictionary[HTTPCookiePropertyKey.secure] = (cookie.isSecure ? "YES" : "NO")
            cookieDictionary[HTTPCookiePropertyKey.version] = "\(cookie.version)"
            if (cookie.expiresDate != nil) {
                cookieDictionary[HTTPCookiePropertyKey.expires] = cookie.expiresDate
            }
            cookies.append(cookieDictionary)
        }
        
        let cookieData = try? JSONSerialization.data(withJSONObject: cookies, options: .prettyPrinted)
        let JSONString = String(data: cookieData!, encoding: .utf8)
        try? JSONString?.write(toFile: storagePath(), atomically: true, encoding: .utf8)
    }
    
    func loadCookie() {
        
        let JSONString = try? String.init(contentsOfFile: storagePath(), encoding: .utf8) 
        let cookies = try? JSONSerialization.jsonObject(with: Data(base64Encoded: JSONString!)!, options: .allowFragments) as! [[HTTPCookiePropertyKey: Any]]
        for cookie: [HTTPCookiePropertyKey: Any] in cookies! {
            HTTPCookieStorage.shared.setCookie(HTTPCookie(properties: cookie)!)
        }
    }
    
    private func storagePath() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return "\(paths[0])/Cookies.data"
    }
}
