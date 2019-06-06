//
//  DetailViewController.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nextContentButton: UIButton!
    @IBAction func previousChapterAction(_ sender: Any) {
    }
    @IBAction func previousContentAction(_ sender: Any) {
    }
    @IBAction func nextContentAction(_ sender: Any) {
    }
    @IBAction func nextChapterAction(_ sender: Any) {
    }
    @IBOutlet weak var nextChapterButton: UIButton!
    @IBOutlet weak var previousContentButton: UIButton!
    @IBOutlet weak var previousChapterButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var scrollViewOutlet: UIScrollView!
    
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
