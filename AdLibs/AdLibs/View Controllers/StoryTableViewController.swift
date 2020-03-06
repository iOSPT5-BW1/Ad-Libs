//
//  StoryTableViewController.swift
//  AdLibs
//
//  Created by Marc Jacques on 3/5/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class StoryTableViewController: UITableViewController {
    //  MARK: - Properties and Outlets
    
    var adLibController = AdLibController()
    var storyState = StoryState.updateStory

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    func setTheme() {
        switch Settings.shared.changeBackground {
        case 0:
            view.backgroundColor = .blue
        case 1:
            view.backgroundColor = UIColor(red: 129/255, green: 194/255, blue: 183/255, alpha: 1.0)
        case 2:
            view.backgroundColor = .darkGray
        case 3:
            view.backgroundColor = .systemGray3
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return adLibController.storyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
        let story = storiesFor(indexPath: indexPath)
        cell.story = story
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let story = storiesFor(indexPath: indexPath)
            adLibController.deleteStory(which: story)
            tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditStorySegue" {
            guard let showStoryVC = segue.destination as? StoryViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            showStoryVC.adLibController = adLibController
            let story = adLibController.storyList[indexPath.row]
            showStoryVC.storyFound = story
            showStoryVC.storyState = storyState
        }
    }
    private func storiesFor(indexPath: IndexPath) -> Story {
        var story: Story?
        story = adLibController.sortStories[indexPath.row]
        return story!
    }
    
}
