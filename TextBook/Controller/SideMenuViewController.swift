//
//  SideMenuViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 07/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//


//This will be my side menu view
import UIKit

class SideMenuViewController: UIViewController {
    
    var btnMenu: UIButton!
    @IBOutlet weak var innerViewOutlet: UIView!
    
    @IBOutlet weak var sideMenuTableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func hideSideMenu(){
        btnMenu.tag = 0
        btnMenu.isHidden = false
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
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
        cell.sideMenuChapterNameLabel.text = "\(indexPath.row + 1). \(AppDataSource.appDataSource.ChaptersTitles[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let topViewController : DetailViewController = self.navigationController!.topViewController! as? DetailViewController{
            topViewController.chapterNumber = indexPath.row
            topViewController.pageNumber = 0
            topViewController.setPageContent()
        }
        self.hideSideMenu()
    }
}
