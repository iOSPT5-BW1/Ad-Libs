//
//  AdLib.swift
//  AdLibs
//
//  Created by Marc Jacques on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct AdLib: Codable, Equatable {
    var title: String
    var noun: String
    var pronoun: String
    var verb: String
    var adjective: String
    var adverb: String
    var color: String
    var story: String
    
    init(title: String = "", noun: String, pronoun: String, verb: String, adjective: String, adverb: String, color: String, story: String = " ") {
        self.title = title
        self.noun = noun
        self.pronoun = pronoun
        self.verb = verb
        self.adjective = adjective
        self.adverb = adverb
        self.color = color
        self.story = story
    }
}
