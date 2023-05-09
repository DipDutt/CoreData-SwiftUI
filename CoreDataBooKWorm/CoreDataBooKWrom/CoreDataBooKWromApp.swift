//
//  CoreDataBooKWromApp.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 6/5/23.
//

import SwiftUI

@main
struct CoreDataBooKWromApp: App {
    @StateObject var datacontoller = coreDataViewModel()
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environment(\.managedObjectContext, datacontoller.Container.viewContext)
        }
    }
}
