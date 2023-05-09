//
//  coredataManager.swift
//  coredataSetUp
//
//  Created by Dip Dutt on 23/3/23.
//

import Foundation
import CoreData


class coredataManager {
    let container:NSPersistentContainer
    
    init() {
    container = NSPersistentContainer(name: "coredataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("the error is \(error.localizedDescription)")
            }
        }
    }
    
    func fetchMovies()->[Movie]{
        let request:NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
             return try container.viewContext.fetch(request)
        } catch  {
            return []
        }
    }
    
    func saveMovie(title:String) {
        let movie = Movie(context: container.viewContext)
        movie.title = title
        
        do {
            try container.viewContext.save()
        } catch  {
            print(" can't save the title of a movie")
        }
    }
}
