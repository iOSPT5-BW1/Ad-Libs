//
//  AdLibController.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class AdLibController {
   
    var storyList: [Story] = []
    
    init() {
           loadFromPersistentStore()
       }
    
    private var persistentFileURL: URL? {
        // Singleton = single instance that can be used throughout the app
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("adLibs.plist")
    }
   

    //Save and Load methods
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()//we need a plist encoder = property list
            let data = try encoder.encode(storyList) //this is how we actually encode our model object
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
            storyList = try decoder.decode([Story].self, from: data)
        } catch {
            print("Error loading storyList data: \(error)")
        }
    }
    
    @discardableResult func createStory(title: String, body: String) -> Story {
        let storysaved = Story(body: body, title: title)
        storyList.append(storysaved)
        saveToPersistentStore()
        return storysaved
    }
    
    func updateStory(newTitle: String, newBody: String, oldStory: Story) {
        guard let index = storyList.firstIndex(of: oldStory) else { return }
        let updatedStory = Story(body: newBody, title: newTitle)
        storyList.remove(at: index)
        storyList.insert(updatedStory, at: index)
        saveToPersistentStore()
    }
    
      func deleteStory(which story: Story) {
          guard let index = storyList.firstIndex(of: story) else { return }
          storyList.remove(at: index)
          saveToPersistentStore()
      }
    
    var sortStories: [Story] {
        let sortedStories = storyList.sorted(by: { $0.title.lowercased() < $1.title.lowercased() })
        return sortedStories
    }
}
