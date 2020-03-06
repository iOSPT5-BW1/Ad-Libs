//
//  Words.swift
//  AdLibs
//
//  Created by David Williams on 3/3/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct Words {
    var noun: String
    var pronoun: String
    var verb: String
    var adjective: String
    var adverb: String
    var color: String
    var story: String
    
    init(noun: String, pronoun: String, verb: String, adjective: String, adverb: String, color: String, story: String = "" ) {
        self.noun = noun
        self.pronoun = pronoun
        self.verb = verb
        self.adjective = adjective
        self.adverb = adverb
        self.color = color
        self.story = story
    }
}
