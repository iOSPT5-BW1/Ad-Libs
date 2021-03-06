//
//  AdLibController.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class AdLibController {
    //stars can only be set by star controller
    private(set) var adLibs: [AdLib] = []
    
    private var persistentFileURL: URL? {
        // Singleton = single instance that can be used throughout the app
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        // /Users/MJ/Documents
        // /Users/MJ/Documents/adLibs.plist
        
        return documents.appendingPathComponent("adLibs.plist")
        
    }
    init() {
        loadFromPersistentStore()
    }
    @discardableResult func createAdLib(title: String, noun: String, pronoun: String, verb: String, adjective: String, adverb: String, color: String) -> AdLib {
        
        let adLib = AdLib(title: title, noun: noun, pronoun: pronoun, verb: verb, adjective: adjective, adverb: adverb, color: color)
        adLibs.append(adLib)
        saveToPersistentStore()
        return adLib
    }
    
    func list() -> String {
        var output = ""
        for adlib in adLibs {
            output += "\(adlib.title) "
        }
        return output
    }
    
    //Save and Load methods
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        //we need to convert the data in the file into nits of data that can be encoded
        //in order to do this we need to ensure the model is encodable
        //now we need to encode into data for plist
        do {
            let encoder = PropertyListEncoder()//we need a plist encoder = property list
            let data = try encoder.encode(adLibs) //this is how we actually encode our model object
            try data.write(to: url) //now write it to the url we recently created. the url is the adLibs.plist that we created
        } catch {
            print("Error saving the adLibs data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            adLibs = try decoder.decode([AdLib].self, from: data)
        } catch {
            print("Error loading adLibs data: \(error)")
        }
    }
    
    func updateStory(adLib: AdLib, newStory: String) {
           guard let index = adLibs.firstIndex(of: adLib) else { return }
           var updateAdLib = adLib
           updateAdLib.title = newStory
           adLibs.remove(at: index)
           adLibs.insert(updateAdLib, at: index)
           saveToPersistentStore()
       }
}
