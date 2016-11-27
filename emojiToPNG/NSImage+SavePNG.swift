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
    var imagePNGRepresentation: Data {
        return NSBitmapImageRep(data: tiffRepresentation!)!.representation(using: .PNG, properties: [:])!
    }
    func savePNG(_ path:String) -> Bool {
        return ((try? imagePNGRepresentation.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil)
    }
}
