//
//  SideMenuViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 07/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import UIKit
protocol sideMenuDelegate{
    func sideMenuItemSelectedAtIndex(_ index : Int32)
}


class SideMenuViewController: UIViewController {
    
    var btnMenu: UIButton!
    @IBOutlet weak var innerViewOutlet: UIView!
    
    @IBOutlet weak var sideMenuTableViewController: UITableView!
    var delegate: sideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDataSource.appDataSource.ChaptersTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell") as! sideMenuTableViewCell
        cell.sideMenuChapterNameLabel.text = AppDataSource.appDataSource.ChaptersTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.chapterNumber = indexPath.row
        vc.pageNumber = 0
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
}
