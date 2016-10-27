//
//  Collection+Safe.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}
