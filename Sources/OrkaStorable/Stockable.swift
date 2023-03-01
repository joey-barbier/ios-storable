//
//  Stockable.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import Foundation
import OrkaCoreDataWrapper

public class OrkaStorable {
    public static func setup() {
        guard let container = PersistenceController.shared?.container else {
            return
        }
        let _ = CoreDataConfig.init(with: container)
    }
}

public protocol Stockable: Identifiable, Codable {
    var storage: Storage<Self> {get}
    static var restore: Restore<Self>.Type {get}
    var tag: String {get}
}

public extension Stockable {
    var storage: Storage<Self> {
        return Storage(self)
    }
    static var restore: Restore<Self>.Type {
        return Restore<Self>.self
    }
    var tag: String {
        return "\(Self.self)"
    }
}

extension Stockable {
    static func getId(id: String, tag: String) -> String {
        return "\(self.self)_\(id)_\(tag)"
    }
}
