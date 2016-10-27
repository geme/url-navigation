//
//  URL+URLComponents.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import Foundation

extension URL {
    var queryItems: [String: String]? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItemsDictionary
    }
}

extension URLComponents {

    init?(queryItems: [String: String]) {
        self.init(string: queryItems.flatMap { (key, value) in "\(key)=\(value)" }
                                    .reduce("") { (result, next) in result.characters.count == 0 ? "?\(next)" : result + "&\(next)" })
    }

    var queryItemsDictionary: [String: String]? {
        return self.queryItems?
            .reduce([:], { (params, item) -> [String: String] in
                var p = params
                if let value = item.value {
                    p.updateValue(value, forKey: item.name)
                } else {
                    p.updateValue("", forKey: item.name)
                }
                return p
            })
    }

}
