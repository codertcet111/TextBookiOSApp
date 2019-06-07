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
        self.setChapterContext()
        self.contentDescriptionLabel.text = AppDataSource.appDataSource.RawContext
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    func setPageContent(){
        //        self.imageView
        self.imageView.sd_setShowActivityIndicatorView(true)
        self.imageView.sd_setIndicatorStyle(.gray)
        self.imageView.sd_setImage(with: URL(string: AppDataSource.appDataSource.ChapterContentsImages[self.pageNumber]), placeholderImage: UIImage(named:"Entertanment.png"))
//        self.giveFlashAnimation()
    }
    
    func setChapterContext(){
        self.chapterTitleLabel.text = AppDataSource.appDataSource.ChaptersTitles[self.chapterNumber]
        self.setPageContent()
    }
    
    func giveFlashAnimation(){
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0.0
        }) { finished in
            self.view.removeFromSuperview()
        }
    }
    
}
