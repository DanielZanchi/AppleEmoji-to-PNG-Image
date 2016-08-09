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
    func image(mySize: CGFloat) -> NSImage {
        let size = CGSize(width: mySize, height: mySize)
        let image = NSImage(size: size)
        
        let rep = NSBitmapImageRep.init(bitmapDataPlanes: nil, pixelsWide: Int(size.width), pixelsHigh: Int(size.height), bitsPerSample: 16, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: NSCalibratedRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0)
        
        image.addRepresentation(rep!)
        image.lockFocus()
        
        NSColor.clearColor().set()
        let rect = NSMakeRect(0, 4, size.width, size.height)
        let ctx = NSGraphicsContext.currentContext()?.CGContext
        CGContextClearRect(ctx, rect)
        CGContextSetFillColorWithColor(ctx, NSColor.clearColor().CGColor)
        CGContextFillRect(ctx, rect)
        (self as NSString).drawInRect(rect, withAttributes: [NSFontAttributeName: NSFont.systemFontOfSize(mySize)])
        
        image.unlockFocus()
        
        return image
    }
}