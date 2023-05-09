//
//  coreDataViewModel.swift
//  coredataMVVM
//
//  Created by Dip Dutt on 24/3/23.
//

import Foundation
import SwiftUI
import CoreData

class coreDataViewModel:ObservableObject {
    
@Published var fruitNames:[Fruit] = []
    
 let Container:NSPersistentContainer
    
    init() {
        Container = NSPersistentContainer(name: "coreDataModel")
        Container.loadPersistentStores { description, error in
            if let error = error {
                print("the error is \(error.localizedDescription)")
            }
        }
        fetchFruitName()
    }
    
    func fetchFruitName() {
        let request = NSFetchRequest<Fruit>(entityName: "Fruit")
        
        do {
            fruitNames = try Container.viewContext.fetch(request)
        } catch let error {
            print("Error fectching \(error)")
        }
    }
    
    func addFruitName(text:String) {
        let fruit = Fruit(context: Container.viewContext)
        fruit.name = text
        saveData()
    }
    
    func saveData() {
        
        do {
            try Container.viewContext.save()
            fetchFruitName()
        } catch let error {
            print("Error save data \(error)")
        }
    }
    
    func deleteitem(indexSet:IndexSet) {
         guard let indexnumber = indexSet.first else {return}
        let entity = fruitNames[indexnumber]
        Container.viewContext.delete(entity)
        saveData()
    }
    
    func update(enitity:Fruit) {
        let currentName = enitity.name ?? ""
        let updateitem = currentName + "!"
        enitity.name = updateitem
        saveData()
    }
    
}
