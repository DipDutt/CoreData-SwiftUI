//
//  coreDataViewModel.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 6/5/23.
//

import Foundation
import CoreData
import SwiftUI


class coreDataViewModel: ObservableObject {
    let Container = NSPersistentContainer(name: "Bookworm")
  
    init() {
        Container.loadPersistentStores { description, error in
            if let error = error {
                print("can't load core data \(error.localizedDescription)")
            }
            else {
                print("Coredata load sucessfully")
            }
                
        }
    }
    
    func addBooks() {
        
    }
    
}
