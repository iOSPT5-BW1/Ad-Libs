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
    var themeHelper = ThemeHelper()
    var pickerData = ["Blue", "Dark", "Green", "Purple", "Teal"]
    
    @IBOutlet weak var themePicker: UIPickerView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var storyLabel1: UILabel!
    @IBOutlet weak var storyLabel2: UILabel!
    @IBOutlet weak var storyLabel3: UILabel!
    
    var themeDelegate: ThemeSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker.delegate = self
        updateViews()
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
        let themePicked = pickerData[themePicker.selectedRow(inComponent: 0)]
        switch themePicked {
        case "Blue":
            themeHelper.setThemePreferenceToBlue()
        case "Dark":
            themeHelper.setThemePreferenceToDark()
        case "Green":
            themeHelper.setThemePreferenceToGreen()
        case "Purple":
            themeHelper.setThemePreferenceToPurple()
        case "Teal":
            themeHelper.setThemePreferenceToTeal()
        default:
            break
        }
        choseTheme()
    }
    
    func choseTheme() {
        themeDelegate?.themeChosen()
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        switch theme {
        case "Blue":
            view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .systemGreen
        case "Purple":
            view.backgroundColor = .systemPurple
        case "Teal":
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
    
    func updateViews() {
        setTheme()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func story1Switch(_ sender: Any) {
    }
    @IBAction func story2Switch(_ sender: Any) {
    }
    @IBAction func story3Switch(_ sender: Any) {
    }
    
    @IBAction func selectSettingsButtonTapped(_ sender: Any) {
    }
    
}
