//
//  DetailViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    let bookmarkedKeyName: String = "bookmarkedPages"
    var chapterNumber: Int = 0
    var pageNumber: Int = 0
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nextContentButton: UIButton!
    @IBAction func previousChapterAction(_ sender: Any) {
        if self.chapterNumber != 0{
            self.pageNumber = 0
            self.chapterNumber -= 1
            self.setPageContent()
        }
    }
    @IBAction func previousContentAction(_ sender: Any) {
        if self.pageNumber != 0{
            self.pageNumber -= 1
            self.setPageContent()
        }
    }
    @IBAction func nextContentAction(_ sender: Any) {
        if self.pageNumber != AppDataSource.appDataSource.ChapterContentsImages.count - 1{
            self.pageNumber += 1
            self.setPageContent()
        }
    }
    @IBAction func nextChapterAction(_ sender: Any) {
        if self.chapterNumber != AppDataSource.appDataSource.ChaptersTitles.count - 1{
            self.chapterNumber += 1
            self.pageNumber = 0
            self.setPageContent()
        }
    }
    @IBOutlet weak var nextChapterButton: UIButton!
    @IBOutlet weak var previousContentButton: UIButton!
    @IBOutlet weak var previousChapterButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var scrollViewOutlet: UIScrollView!
    
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        self.initializeBookmarkData()
        self.setBookmarkedAndShareImage()
        self.setPageContent()
        self.contentDescriptionLabel.text = AppDataSource.appDataSource.RawContext
        super.viewDidLoad()
        self.addSlideMenuButton()
//        giveMarquePropertyToLabel()
    }
    
    func giveMarquePropertyToLabel(){
        UIView.animate(withDuration: 1.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
            self.chapterTitleLabel.center = CGPoint(x: self.chapterTitleLabel.bounds.size.width, y: self.chapterTitleLabel.center.y)
        }, completion:  { _ in })
    }
    
    func setPageContent(){
        self.setBookmarkedColor()
        self.imageView.sd_setShowActivityIndicatorView(true)
        self.imageView.sd_setIndicatorStyle(.gray)
        self.imageView.sd_setImage(with: URL(string: AppDataSource.appDataSource.ChapterContentsImages[self.pageNumber]), placeholderImage: UIImage(named:"Tree"))
        self.chapterTitleLabel.text = "\(self.chapterNumber + 1).\(self.pageNumber + 1) \(AppDataSource.appDataSource.ChaptersTitles[self.chapterNumber])"
    }
//    
//    func setChapterContext(){
//        self.setPageContent()
//    }
    
    func initializeBookmarkData(){
        if UserDefaults.standard.array(forKey: self.bookmarkedKeyName) as? [[Bool]] == nil{
            let bookmarkedArray = Array(repeating: Array(repeating: false, count: AppDataSource.appDataSource.ChapterContentsImages.count), count: AppDataSource.appDataSource.ChaptersTitles.count)
            UserDefaults.standard.set(bookmarkedArray, forKey: self.bookmarkedKeyName)
        }
    }
    
    func setBookmarkedAndShareImage(){
        let bookmarkBarButtonItem = UIBarButtonItem(image: UIImage(named: "bookmarkedImages.png")?.withRenderingMode(.alwaysOriginal),
                                            style: .plain,
                                            target: self,
                                            action: #selector(bookmarkedButtonTapped))
        let shareBarButtonItem = UIBarButtonItem(image: UIImage(named: "ShareOurAppNow.png")?.withRenderingMode(.alwaysOriginal),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(self.shareButtonTapped(_:)))
        
        self.navigationItem.rightBarButtonItems = [bookmarkBarButtonItem, shareBarButtonItem]
        self.setBookmarkedColor()
    }
    
    func setBookmarkedColor(){
        let bookmarkedData = UserDefaults.standard.array(forKey: self.bookmarkedKeyName) as? [[Bool]]
        if bookmarkedData?[self.chapterNumber][self.pageNumber] == true{
            self.navigationItem.rightBarButtonItem?.image = self.navigationItem.rightBarButtonItem?.image?.withRenderingMode(.alwaysTemplate)
            self.navigationItem.rightBarButtonItem?.tintColor = .red
        }else{
            self.navigationItem.rightBarButtonItem?.image = self.navigationItem.rightBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButton.ButtonType.system)
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControl.State())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(self.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            
            sender.tag = 0
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : SideMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuViewController") as!SideMenuViewController
        menuVC.btnMenu = sender
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
    
    @objc func bookmarkedButtonTapped() {
        var bookmarkedData = UserDefaults.standard.array(forKey: self.bookmarkedKeyName) as? [[Bool]]
        if bookmarkedData?[self.chapterNumber][self.pageNumber] == true{
           bookmarkedData?[self.chapterNumber][self.pageNumber] = false
        }else{
            bookmarkedData?[self.chapterNumber][self.pageNumber] = true
        }
        UserDefaults.standard.set(bookmarkedData, forKey: self.bookmarkedKeyName)
        self.setBookmarkedColor()
    }
    
    @objc func shareButtonTapped(_ sender: UIButton){
        
        //Set the default sharing message.
        let message = "Download our App."
        //AppStore link for our app
        let link = NSURL(string: "http://appstore.com")
        let objectsToShare = [message, link!] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            activityVC.popoverPresentationController?.sourceView = self.view
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
