//
//  ios_storable_demoApp.swift
//  ios-storable-demo
//
//  Created by Joey BARBIER on 27/06/2022.
//

import SwiftUI
import OrkaStorable

@main
struct ios_storable_demoApp: App {
    var body: some Scene {
        WindowGroup {
            Views.Home()
        }
    }
    
    init() {
        OrkaStorable.setup()
    }
}
