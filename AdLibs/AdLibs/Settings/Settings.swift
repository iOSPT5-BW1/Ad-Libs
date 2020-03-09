//
//  Settings.swift
//  AdLibs
//
//  Created by David Williams on 2/29/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation
import UIKit

class Settings {
    static let shared = Settings()
    var story: StoryTemplate = .random
    var storyChanged: Bool = false
    var changeBackground = UserDefaults.standard.integer(forKey: "themeSet")
    var randomYes: Bool = false
}

