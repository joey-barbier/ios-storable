//
//  Storage.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import Foundation
import OrkaCoreDataWrapper

public class Storage<T: Stockable> {
    private var item: T
    
    init(_ item: T) {
        self.item = item
    }
}

public extension Storage {
    enum Error: Swift.Error {
        case encodingFailed
        case coreDataContextNotFound
        case itemNotFound
    }
}

// MARK: - Create / Update
public extension Storage {
    func add(withTag tag: String) throws {
        guard let data = try? JSONEncoder().encode(item),
              let dataStr = String(data: data, encoding: .utf8)
        else {
            throw Error.encodingFailed
        }
        let idBdd = T.getId(id: "\(item.id)", tag: tag)
        Bookmark(id: idBdd,
                 data: dataStr,
                 tag: tag)
    }
}

// MARK: - Read
public extension Storage {
    func isPresent(atTag tag: String) -> Bool {
        let idBdd = T.getId(id: "\(item.id)", tag: tag)
        let params = [
            "identifier" : [idBdd],
            "tag": [tag]
        ]
        let item: Bookmark? = .bdd.findBy(fromParams: params).first
        return item != nil
    }
}

// MARK: - Toggle
public extension Storage {
    func toggle(withTag tag: String) throws {
        if isPresent(atTag: tag) {
            try remove(withTag: tag)
            return
        }
        try add(withTag: tag)
    }
}

// MARK: - Delete
public extension Storage {
    func remove(withTag tag: String) throws {
        let idBdd = T.getId(id: "\(item.id)", tag: tag)
        let params = [
            "identifier" : [idBdd],
            "tag": [tag]
        ]
        guard let item: Bookmark = .bdd.findBy(fromParams: params).first else {
            throw Error.itemNotFound
        }
        CoreDataHelper.context?.delete(item)
        CoreDataHelper.save()
        
        let itemB: Bookmark? = .bdd.findBy(id: idBdd)
        print("is present: \(itemB != nil)")
    }
}
