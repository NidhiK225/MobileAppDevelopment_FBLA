//
//  FormControl.swift
//  MobileAppDev3
//
//  Created by Nidhi Krishna on 1/4/24.
//

import Foundation

@objc protocol FormControl {
    var key: String? { get }
    var text: String? { get }
    func clear()
}

class Form: NSObject {
    @IBOutlet var controls: [FormControl]?
    subscript(_ key: String) -> String? {
        return value(for: key)
    }
    func value(for key: String) -> String? {
        return controls?.first(where: { $0.key == key })?.text
    }
    func clear() {
        controls?.forEach { $0.clear() }
    }
}
