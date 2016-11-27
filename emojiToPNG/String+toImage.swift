//
//  String+toImage.swift
//  emojiToPNG
//
//  Created by Daniel Zanchi on 09/08/16.
//  Copyright © 2016 Daniel Zanchi. All rights reserved.
//

import Foundation
import Cocoa

extension String {
    func image(_ mySize: CGFloat) -> NSImage {
        let size = CGSize(width: mySize, height: mySize)
        let image = NSImage(size: size)
        
        let rep = NSBitmapImageRep.init(bitmapDataPlanes: nil, pixelsWide: Int(size.width), pixelsHigh: Int(size.height), bitsPerSample: 16, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: NSCalibratedRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0)
        
        image.addRepresentation(rep!)
        image.lockFocus()
        
        NSColor.clear.set()
//        let rect = NSMakeRect(0, 4, size.width, size.height)
        let rect = NSMakeRect(0, 0, size.width, size.height)
        let ctx = NSGraphicsContext.current()?.cgContext
        ctx?.clear(rect)
        ctx?.setFillColor(NSColor.clear.cgColor)
        ctx?.fill(rect)
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: NSFont.systemFont(ofSize: mySize-3)])
        
        image.unlockFocus()
        
        return image
    }
}
