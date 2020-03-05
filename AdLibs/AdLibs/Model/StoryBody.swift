//
//  Story.swift
//  AdLibs
//
//  Created by David Williams on 3/4/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct StoryBody: Equatable {
    
    var filledStory: String = ""
    
    init(filledStory: String) {
        self.filledStory = filledStory
    }
}
