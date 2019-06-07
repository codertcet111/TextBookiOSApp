//
//  DetailViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseViewController {
    
    let bookmarkedKeyName: String = "bookmarkedPages"
    var chapterNumber: Int = 0
    var pageNumber: Int = 0
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nextContentButton: UIButton!
    @IBAction func previousChapterAction(_ sender: Any) {
        if self.chapterNumber != 0{
            self.pageNumber = 0
            self.chapterNumber -= 1
            self.setChapterContext()
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
            self.setChapterContext()
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
        self.setChapterContext()
        self.contentDescriptionLabel.text = AppDataSource.appDataSource.RawContext
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    func setPageContent(){
        //        self.imageView
        self.setBookmarkedColor()
        self.imageView.sd_setShowActivityIndicatorView(true)
        self.imageView.sd_setIndicatorStyle(.gray)
        self.imageView.sd_setImage(with: URL(string: AppDataSource.appDataSource.ChapterContentsImages[self.pageNumber]), placeholderImage: UIImage(named:"Entertanment.png"))
//        self.giveFlashAnimation()
    }
    
    func setChapterContext(){
        self.chapterTitleLabel.text = AppDataSource.appDataSource.ChaptersTitles[self.chapterNumber]
        self.setPageContent()
    }
    
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
                                                    action: #selector(shareButtonTapped))
        
//        let bookmarkBarButtonItem = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
//        bookmarkBarButtonItem.setBackgroundImage(UIImage(named: "bookmarkedImages.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        bookmarkBarButtonItem.addTarget(self, action: #selector(bookmarkedButtonTapped), for: .touchUpInside)
//
//        let shareBarButtonItem = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
//        shareBarButtonItem.setBackgroundImage(UIImage(named: "shareTheAppNow.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        shareBarButtonItem.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
//
//        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: bookmarkBarButtonItem), UIBarButtonItem(customView: shareBarButtonItem)]
        
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
    
    @objc fileprivate func bookmarkedButtonTapped() {
        var bookmarkedData = UserDefaults.standard.array(forKey: self.bookmarkedKeyName) as? [[Bool]]
        if bookmarkedData?[self.chapterNumber][self.pageNumber] == true{
           bookmarkedData?[self.chapterNumber][self.pageNumber] = false
        }else{
            bookmarkedData?[self.chapterNumber][self.pageNumber] = true
        }
        UserDefaults.standard.set(bookmarkedData, forKey: self.bookmarkedKeyName)
        self.setBookmarkedColor()
    }
    
    @objc fileprivate func shareButtonTapped(){
        //Set the default sharing message.
        let message = "Download our App."
        //AppStore link for our app
        if let link = NSURL(string: "http://appstore.com")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
}
