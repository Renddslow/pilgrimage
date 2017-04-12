//
//  Chapter.swift
//  Pilgrimage
//
//  Created by Renddslow on 4/11/17.
//  Copyright © 2017 porcupineinc. All rights reserved.
//

import Foundation
import UIKit

class Chapters {
    let chapterOne: Chapter
    let chapterOneRemember: Chapter
    let chapterOneDontRemember: Chapter
    
    init() {
        self.chapterOneDontRemember = Chapter(title: "I Don't Remember",
                                              story: "Figures. I'm no one could take a hit like that and remember their own name. You at least remember that don't ya? ... Oh boy this is worse than I thought.",
                                              choices: [])
        self.chapterOneRemember = Chapter(title: "I Remember",
                                          story: "Very good, I shan't remind you then. That is if you're sure.",
                                          choices: [])
        self.chapterOne = Chapter(title: "What's Happening?",
                                  story: "Good morning, traveller. Whoa whoa, you're okay. You took quite a blow to the head, but you'll be fine. Here drink this. Do you remember where you are?",
                                  choices: [self.chapterOneRemember, self.chapterOneDontRemember])
    }
}

class Chapter {
    
    let title: String
    let story: String
    var choices: [Chapter] = []
    
    init(title: String, story: String, choices: [Chapter]) {
        self.title = title
        self.story = story
        self.choices = choices
    }
}
