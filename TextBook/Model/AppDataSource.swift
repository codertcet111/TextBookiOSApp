//
//  AppDataSource.swift
//  TextBook
//
//  Created by Shubham Mishra on 06/06/19.
//  Copyright © 2019 Shubham Mishra. All rights reserved.
//

import Foundation

class AppDataSource{
    
    static let appDataSource = AppDataSource()
    
    private init(){
    }
    
    let ChaptersTitles: [String] = ["Introduction","Journey Beging","Middle Of the Land","On The Edge","Conclusion"]
    let ChapterContentsImages: [String] = ["https://www.gstatic.com/webp/gallery3/1.sm.png", "https://www.gstatic.com/webp/gallery/4.sm.jpg", "https://www.gstatic.com/webp/gallery3/2.sm.png", "https://www.gstatic.com/webp/gallery3/3.sm.png", "https://www.gstatic.com/webp/gallery3/5.sm.png"]
    
    let RawContext: String = """
Mary was alone again on a Saturday. Her father, Harold was on another business trip to Mississippi, and the house was all to herself, which meant she could have pasta every day if she wanted.

Her medicine for lowering her testosterone levels made her gain weight, and her father was not keen on her pasta indulgence.

I can add tuna too. Some mozzarella. It was so quiet in the house, her thoughts sounded like they were being spoken out loud. In the town of Woodway, Washington, there’s not much to hear besides birdsong and the rumble of an occasional car.

Mary peeled back her fluffy blanket and stiffly walked to the kitchen. She connected her iPhone to the old karaoke speaker no one used for karaoke, and put on Cardi B. A 808 beat reverberated off the high living room ceiling. Cardi’s rhymes and ghetto style among blue jay calls.
    
As she sat down on the red leather couch of the TV room, she started to jam pasta in her mouth out of hunger and indulgence. Basketball Wives was playing.
"""

    
}
