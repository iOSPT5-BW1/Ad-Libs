//
//  Settings.swift
//  AdLibs
//
//  Created by David Williams on 2/29/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class Settings {
    static let shared = Settings()
    private init() {}
    var story: Story = .story1
    var changeBackground = UserDefaults.standard.integer(forKey: "themeSet") 
}

