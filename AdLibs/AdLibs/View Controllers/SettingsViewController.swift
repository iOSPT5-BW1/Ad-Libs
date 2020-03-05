//
//  SettingsViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/26/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

protocol ThemeSelectedDelegate {
    func themeChosen()
}
class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData = ["Blue", "Cyan", "Dark", "Gray", "Green","Light", "Orange", "Purple", "Teal", "Yellow"]
    
    @IBOutlet weak var themePicker: UIPickerView!
    @IBOutlet weak var story1Button: UIButton!
    @IBOutlet weak var story2Button: UIButton!
    @IBOutlet weak var story3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker.delegate = self
        themePicker.selectRow(Settings.shared.changeBackground, inComponent:
            0, animated: true)
        themePicker.backgroundColor = UIColor(white: 1, alpha: 0.35)
        themePicker.layer.borderColor = UIColor.white.cgColor
        themePicker.layer.borderWidth = 2.5
        themePicker.layer.cornerRadius = 7.5
        customizeButtons(sender: 0)
        
        updateViews()
    }
    
    func customizeButtons(sender: Int) {
        switch sender {
        case 0:
            story1Button.layer.borderColor = UIColor.red.cgColor
            story1Button.layer.borderWidth = 2.5
            story1Button.layer.cornerRadius = 8.0
            story1Button.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.55)
            story2Button.layer.borderColor = UIColor.clear.cgColor
            story3Button.layer.borderColor = UIColor.clear.cgColor
            story2Button.backgroundColor = .clear
            story3Button.backgroundColor = .clear
            Settings.shared.story = .story1
        case 1:
            story2Button.layer.borderColor = UIColor.red.cgColor
            story2Button.layer.borderWidth = 2.5
            story2Button.layer.cornerRadius = 8.0
            story2Button.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.55)
            story1Button.layer.borderColor = UIColor.clear.cgColor
            story3Button.layer.borderColor = UIColor.clear.cgColor
            story1Button.backgroundColor = .clear
            story3Button.backgroundColor = .clear
            Settings.shared.story = .story2
        case 2:
            story3Button.layer.borderColor = UIColor.red.cgColor
            story3Button.layer.borderWidth = 2.5
            story3Button.layer.cornerRadius = 8.0
            story3Button.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.55)
            story1Button.layer.borderColor = UIColor.clear.cgColor
            story2Button.layer.borderColor = UIColor.clear.cgColor
            story1Button.backgroundColor = .clear
            story2Button.backgroundColor = .clear
            Settings.shared.story = .story3

        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Settings.shared.changeBackground = themePicker.selectedRow(inComponent: 0)
        UserDefaults.standard.set(Settings.shared.changeBackground, forKey: "themeSet")
        setTheme()
    }
    //   0       1        2       3       4       5        6        7         8       9
    // "Blue", "Cyan", "Dark", "Gray", "Green", "Light", "Orange", "Purple", "Teal", "Yellow"
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 2:
            view.backgroundColor = .darkGray
        case 3:
            view.backgroundColor = .systemGray2
        case 4:
            view.backgroundColor = .systemGreen
        case 5:
            view.backgroundColor = .lightGray
        case 6:
            view.backgroundColor = .systemOrange
        case 7:
            view.backgroundColor = .systemPurple
        case 8:
            view.backgroundColor = .systemTeal
        case 9:
            view.backgroundColor = .yellow
        default:
            break
        }
    }
    
    func updateViews() {
        setTheme()
    }
    
    @IBAction func storySelectButtonPressed(_ sender: UIButton) {
        Settings.shared.storyChanged = true
        if Settings.shared.storyChanged {
        customizeButtons(sender: sender.tag)
        } else if !Settings.shared.storyChanged {
            customizeButtons(sender: 0)
        }
    }
}
