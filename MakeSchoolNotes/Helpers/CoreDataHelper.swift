//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Howard Wang on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation

import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func returnNote() -> Note {
        return NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
    }
    
    static func saveCoreData() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func deleteNote(note: Note) {
        managedContext.delete(note)
        saveCoreData()
    }
    
    static func retrieveNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        var notes = [Note]()
        do {
            notes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return notes
    }
}

