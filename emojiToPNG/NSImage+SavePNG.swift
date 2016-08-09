//
//  NSImage+SavePNG.swift
//  emojiToPNG
//
//  Created by Daniel Zanchi on 09/08/16.
//  Copyright © 2016 Daniel Zanchi. All rights reserved.
//

import Cocoa
import Foundation

extension NSImage {
    var imagePNGRepresentation: NSData {
        return NSBitmapImageRep(data: TIFFRepresentation!)!.representationUsingType(.NSPNGFileType, properties: [:])!
    }
    func savePNG(path:String) -> Bool {
        return imagePNGRepresentation.writeToFile(path, atomically: true)
    }
}