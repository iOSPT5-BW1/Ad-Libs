//
//  Story.swift
//  AdLibs
//
//  Created by David Williams on 3/4/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

enum StoryState {
    case newStory
    case updateStory
}

enum StoryTemplate: String {
    case story1 = "story1"
    case story2 = "story2"
    case story3 = "story3"
    case random = "random"
}

struct Story: Codable, Equatable {
    
    var body: String = ""
    var title: String = ""
    
    init(body: String, title: String = "") {
        self.body = body
        self.title = title
    }
}
