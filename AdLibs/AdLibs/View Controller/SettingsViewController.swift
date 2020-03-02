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
    var pickerData = ["Blue", "Dark", "Green", "Purple", "Teal"]
    
    @IBOutlet weak var themePicker: UIPickerView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var storyLabel1: UILabel!
    @IBOutlet weak var storyLabel2: UILabel!
    @IBOutlet weak var storyLabel3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker.delegate = self
        themePicker.layer.borderColor = UIColor.gray.cgColor
        themePicker.layer.borderWidth = 2.5
        themePicker.layer.cornerRadius = 7.5

        updateViews()
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
 
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = .darkGray
        case 2:
            view.backgroundColor = .systemGreen
        case 3:
            view.backgroundColor = .systemPurple
        case 4:
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
    
    func updateViews() {
        setTheme()
    }
    
    @IBAction func story1Switch(_ sender: Any) {
    }
    @IBAction func story2Switch(_ sender: Any) {
    }
    @IBAction func story3Switch(_ sender: Any) {
    }
    
    @IBAction func selectSettingsButtonTapped(_ sender: Any) {
        setTheme()
    }
}
