//
//  ViewController.swift
//  emojiToPNG
//
//  Created by Daniel Zanchi on 07/08/16.
//  Copyright © 2016 Daniel Zanchi. All rights reserved.
//

import Cocoa
import Foundation


class ViewController: NSViewController {
    let imageSize: CGFloat = 160
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded
        }
    }
    
    @IBAction func createPressed(_ sender: AnyObject) {
        saveEmojis()
    }
    
    func saveEmojis() {
        createDir()
        //here decide watch arrayString to use
        let emojis = Strings.emojisStringReduced
        for (fileName, emojis) in emojis.enumerated() {
            let image = emojis.image(imageSize/2)
            let ns: NSString = "~/Documents/emojis/\(fileName).png" as NSString
            if !(image.savePNG(ns.expandingTildeInPath)) {
                print("error")
            }
            
        }
    }
    
    func createDir() {
        let ns: NSString = (NSString(string: "~/Documents/emojis")).expandingTildeInPath as NSString
        let manager = FileManager.default
        do {
            try manager.createDirectory(atPath: ns as String, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.description)
        }
    }
    
}



