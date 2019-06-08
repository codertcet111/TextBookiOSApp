//
//  ViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

//This View Controller will be having the Index for each chapters
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{ 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //For Index we are using the number of chapters count from AppDataSource class
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDataSource.appDataSource.ChaptersTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.cellLabelOutlet.text = "\(indexPath.row + 1). \(AppDataSource.appDataSource.ChaptersTitles[indexPath.row])"
        return cell
    }
    
    //Oening up the detail view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.chapterNumber = indexPath.row
        vc.pageNumber = 0
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
}

