//
//  Story.swift
//  AdLibs
//
//  Created by David Williams on 3/4/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct StoryBody: Codable, Equatable {
    
    var filledStory: String = ""
    var title: String = ""
    
    init(filledStory: String, title: String = "") {
        self.filledStory = filledStory
        self.title = title
    }
}
