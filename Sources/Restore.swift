//
//  Restore.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import Foundation
import CoreData

public class Restore<T: Stockable> {
    static public func find(byId id: String, tag: String) -> T?  {
        let idBdd = T.getId(id: id, tag: tag)
        guard let bookmark: Bookmark = Bookmark.bdd.findBy(id: idBdd) else {
            return nil
        }
        return decode(item: bookmark)
    }
    
    static public func find(byTag tag: String) -> [T] {
        let bookmarks: [Bookmark] = Bookmark.bdd.findBy(fromParams: ["tag": [tag]])
        let items = bookmarks.map({ decode(item: $0) })
        return items.filter({$0 != nil}) as? [T] ?? []
    }
    
    static func decode(item: Bookmark) -> T? {
        guard let data = item.data.data(using: .utf8),
                let itemDecode = try? JSONDecoder().decode(T.self, from: data)
        else {
            return nil
        }
        return itemDecode
    }
}
