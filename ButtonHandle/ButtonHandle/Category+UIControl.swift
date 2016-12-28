//
//  Category+UIControl.swift
//  ButtonHandle
//
//  Created by allthings_LuYD on 16/8/23.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

import Foundation
import UIKit


public extension UIButton {

    private struct AssociatedKeys {
        static var ss_acceptTime = "UIControl_acceptTime"
        static var ss_ignoreEvent = "UIControl_ignoreEvent"
    }

    var ss_accepet_time: Float {
        get {
            let ss_accepet_time_ac = objc_getAssociatedObject(self, &AssociatedKeys.ss_acceptTime) as! Float
            return ss_accepet_time_ac
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ss_acceptTime, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var ss_ignore_event: Bool {
        get {
            let ss_ignore_event_ac = objc_getAssociatedObject(self, &AssociatedKeys.ss_ignoreEvent) as! Bool
            return ss_ignore_event_ac
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ss_ignoreEvent, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }


     override open class func initialize() {
        let a :Method = class_getInstanceMethod(self, #selector(UIButton.sendAction(_:to:for:)))
        let b :Method = class_getInstanceMethod(self, #selector(UIButton.ss_sendAction(_:to:for:)))
        method_exchangeImplementations(a, b)
    }

    func ss_sendAction(_ action: Selector, to target: AnyObject?, for event: UIEvent?) {
        if self.ss_ignore_event {
            return
        }

        if self.ss_accepet_time > 0 {
            self.ss_ignore_event = true
            self.perform(#selector(setter: ss_ignore_event), with: false, afterDelay: TimeInterval(self.ss_accepet_time))
        }

        self.ss_sendAction(action, to: target, for: event)
    }


}


