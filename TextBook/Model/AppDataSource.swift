//
//  AppDataSource.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import Foundation

//Singleton class created for the Model
class AppDataSource{
    
    static let appDataSource = AppDataSource()
    
    private init(){
    }
    
    //I will Use chapter titles as the number of chapters in my Book
    let ChaptersTitles: [String] = ["Introduction","Journey Beging","Middle Of the Land","On The Edge","Conclusion"]
    
    //I will Use ChapterContentsImages as indivisual pages in my Book, so in this case each chapters will have 5 Pages
    let ChapterContentsImages: [String] = ["https://www.gstatic.com/webp/gallery3/1.sm.png", "https://www.gstatic.com/webp/gallery/4.sm.jpg", "https://www.gstatic.com/webp/gallery3/2.sm.png", "https://www.gstatic.com/webp/gallery3/3.sm.png", "https://www.gstatic.com/webp/gallery3/5.sm.png"]
    
    //I am using a single description text for all the pages
    let RawContext: String = """
Mary was alone again on a Saturday. Her father, Harold was on another business trip to Mississippi, and the house was all to herself, which meant she could have pasta every day if she wanted.

Her medicine for lowering her testosterone levels made her gain weight, and her father was not keen on her pasta indulgence.

I can add tuna too. Some mozzarella. It was so quiet in the house, her thoughts Ended here.
"""

    
}
