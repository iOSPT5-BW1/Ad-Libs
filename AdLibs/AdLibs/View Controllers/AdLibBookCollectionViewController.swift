//
//  AdLibBookCollectionViewController.swift
//  AdLibs
//
//  Created by David Williams on 2/27/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class AdLibBookCollectionViewController: UICollectionViewController {

    var adLib: AdLib?
    var adlibController = AdLibController()
    var storyViewController = StoryViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
setTheme()
      //  self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AdlibCell")

        // Do any additional setup after loading the view.
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAdlibSegue" {
            guard let showStoryVC = segue.destination as? StoryViewController else { return }
            showStoryVC.adLibController = adlibController
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return adlibController.storyList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdlibCell", for: indexPath) as? AdLibBookCollectionViewCell else { return UICollectionViewCell() }
        let item = adlibController.storyList[indexPath.item]
        cell.storyBody = item
       
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let adlib = adlibController.storyList[indexPath.item]
    }
    
    
    // MARK: UICollectionViewDelegate

    
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            collectionView.backgroundColor = .blue
        case 1:
            collectionView.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 2:
            collectionView.backgroundColor = .darkGray
        case 3:
            collectionView.backgroundColor = .systemGray3
        case 4:
            collectionView.backgroundColor = .systemGreen
        case 5:
            collectionView.backgroundColor = .lightGray
        case 6:
            collectionView.backgroundColor = .systemOrange
        case 7:
            collectionView.backgroundColor = .systemPurple
        case 8:
            collectionView.backgroundColor = .systemTeal
        case 9:
            collectionView.backgroundColor = .yellow
        default:
            break
        }
    }
}
