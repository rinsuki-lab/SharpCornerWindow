//
//  SharpCornerWindow.swift
//  SharpCornerWindow
//
//  Created by user on 2025/08/26.
//

import AppKit

class SharpCornerWindow: NSWindow {
    @objc func _cornerMask() -> NSImage? {
        guard let superImp = class_getMethodImplementation(superclass!, #selector(_cornerMask)) else {
            return nil
        }
        typealias ObjcMethod = @convention(c) (AnyObject, Selector) -> NSImage?
        let superFn = unsafeBitCast(superImp, to: ObjcMethod.self)

        guard let nsImage = superFn(self, #selector(_cornerMask)) else {
            return nil
        }

        guard nsImage.representations.count == 1, let representation = nsImage.representations.first else {
            return nsImage
        }
        
        let ourRepresentation = NSCustomImageRep(size: representation.size, flipped: false) { rect in
            guard representation.draw(in: rect) else {
                return false
            }
            NSRect(
                origin: rect.origin,
                size: .init(width: rect.width, height: rect.height / 2)
            ).fill()
            return true
        }
        
        nsImage.addRepresentation(ourRepresentation)
        nsImage.removeRepresentation(representation)

        return nsImage
    }
}
