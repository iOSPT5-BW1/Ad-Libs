//
//  StorySelector.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

enum Story {
    case story1
    case story2
    case story3
}

class StorySelector {
    
    var story: Story
    var adLib: AdLib?
    
   
    var noun: String
    var verb: String
    var adjective: String
    var adverb: String
    var pronounPlace: String
    var colorPlace: String
    
    
    var story1 = "Allison takes her two \(noun)s for \(indefiniteArticleCheck(whichWord: verbPlace!)) around the \(noun). They are large \(noun)s. She is a petite girl.  She is thrown about but still manages to keep them under control.\nShe sees her friend Billy across the street, \(verb)ing his three \(noun)s.  They are not large like hers.  They are \(adjective) but they have loud \(noun)s.\nThey pass each other and wave hello and go on their separate ways."
    var story2 =  "You find yourself suddenly in the middle of an orchard of lemon trees.  \"Lemon trees?\" you ask yourself. \"What am I doing here?\"  It doesn’t matter. You are here. Let’s deal with it.\nThe smell of lemons permeates the air. You are tempted to walk over to the nearest tree and pick a lemon. And walk over you do. You reach for a lemon on a low hanging branch. You are pricked by a thorn. Lesson learned.  If you want a lemon, it’s safer from the grocer."
    var story3 = "My house is not a large house. Neither is it a small house. My house is a comfortable house to me to live in. My house is blue with turquoise trim and is only a single story house.\nI have a fairly large backyard to play in and it is right behind a creek. I lose many balls into the creek and have to go and find them.  My dog tries to help me do so. He does not help very well. He gets distracted by noises and I have to find him more often than my balls."
    
    init() {
        if story == nil {
            story = story1
        }
    }
    
    
    func storySelector(story: Story) -> AdLib {
        guard adLib = adLib else { return }
        
        switch story {
        case .story1:
            adLib?.story = story1
        case .story2:
            adLib?.story = story2
        case .story3:
            adLib?.story = story3
        }
        return adLib
    }
}

