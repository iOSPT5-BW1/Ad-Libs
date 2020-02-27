//
//  ThemeHelper.swift
//  AdLibs
//
//  Created by David Williams on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
           setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set("Purple", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToTeal() {
        UserDefaults.standard.set("Teal", forKey: .themePreferenceKey)
    }
    
    var themePreference: String? {
        let theme = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return theme
    }
}
