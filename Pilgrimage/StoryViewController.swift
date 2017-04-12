//
//  ViewController.swift
//  Pilgrimage
//
//  Created by Renddslow on 4/11/17.
//  Copyright © 2017 porcupineinc. All rights reserved.
//

import Foundation
import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chapter: Chapter = fetchCurrentChapter()
        self.storyTitleLabel.text = chapter.title
        self.storyLabel.text = chapter.story
        
        self.choiceOneButton.isHidden = true
        self.choiceTwoButton.isHidden = true
        
        if (chapter.choices.count > 0) {
            self.choiceOneButton.isHidden = false
            self.choiceOneButton.setTitle(chapter.choices[0].title, for: .normal)
            self.choiceOneButton.tag = 0
        }
        
        if (chapter.choices.count > 1) {
            self.choiceTwoButton.isHidden = false
            self.choiceTwoButton.setTitle(chapter.choices[1].title, for: .normal)
            self.choiceTwoButton.tag = 1
        }
    }
    
    func fetchCurrentChapter() -> Chapter {
        let chapters: Chapters = Chapters()
        let chapter: Chapter
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        
        if launchedBefore {
            chapter = UserDefaults.standard.object(forKey: "currentChapter") as? Chapter ?? chapters.chapterOne
        } else {
            chapter = chapters.chapterOne
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        
        return chapter
    }
    
    func saveCurrentChapter(chapter: Chapter) {
        UserDefaults.standard.set(chapter, forKey: "currentChapter")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

