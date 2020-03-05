//
//  AdLibsCollectionViewController.swift
//  AdLibs
//
//  Created by David Williams on 3/3/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class AdLibsCollectionViewController: UICollectionViewController {
    
    var adlibcontroller = AdLibController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setTheme()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartAdLibSegue" {
            let destination = segue.destination as! AdLibCreatorViewController
            destination.adLibController = adlibcontroller
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return adlibcontroller.adLibs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdlibCell", for: indexPath) as? AdLibBookCollectionViewCell else { return UICollectionViewCell()}
        let adlib = adlibcontroller.adLibs[indexPath.item]
        cell.adlib = adlib
        return cell
    }
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = .darkGray
        case 2:
            view.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 3:
            view.backgroundColor = .systemPurple
        case 4:
            view.backgroundColor = .systemTeal
        default:
            break
        }
    }
}

extension AdLibsCollectionViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
}

}
