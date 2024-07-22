//
//  UIImageViewUtils.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 22.07.2024.
//

import UIKit

extension UIImageView {
    func animateMovement(
        duration: TimeInterval,
        delay: TimeInterval = 0,
        endRect: CGRect,
        options: UIView.AnimationOptions = [.repeat, .autoreverse],
        optionalAnimation: @escaping ()->Void = {}
    ) {
        UIView.animate(withDuration: duration, delay: delay, options: options) {
            self.frame = endRect
            optionalAnimation()
        }
    }
    
    func animateOpacity(
        duration: TimeInterval,
        delay: TimeInterval = 0,
        endOpacity: Float,
        options: UIView.AnimationOptions = [.repeat, .curveEaseIn]
    ) {
        UIView.animate(withDuration: duration, delay: delay, options: options) {
            self.layer.opacity = endOpacity
        }
    }
}
