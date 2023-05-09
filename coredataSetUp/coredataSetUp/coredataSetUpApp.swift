//
//  coredataSetUpApp.swift
//  coredataSetUp
//
//  Created by Dip Dutt on 23/3/23.
//

import SwiftUI

@main
struct coredataSetUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: coredataManager())
        }
    }
}
