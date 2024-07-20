//
//  CGRectUtils.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 19.07.2024.
//

import Foundation

extension CGRect {
    func moveToX(_ x: Int) -> CGRect {
        return CGRect(
            x: x,
            y: Int(self.minY),
            width: Int(self.width),
            height: Int(self.height)
        )
    }
    
    func moveToY(_ y: Int) -> CGRect {
        return CGRect(
            x: Int(self.minX),
            y: y,
            width: Int(self.width),
            height: Int(self.height)
        )
    }
}
