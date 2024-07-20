//
//  CloudsView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 18.07.2024.
//

import UIKit

final class CloudsView: UIView {
//    MARK: Views
    private lazy var firstCloud = UIImageView(image: UIImage(resource: .whiteCloud))
    private lazy var secondCloud = UIImageView(image: UIImage(resource: .whiteCloud))
    private lazy var thirdCloud = UIImageView(image: UIImage(resource: .whiteCloud))
    private lazy var fourthCloud = UIImageView(image: UIImage(resource: .whiteCloud))
    
//    MARK: Variables
    private lazy var viewWidth = self.frame.width
    private lazy var viewMidY = Int(self.frame.midY)
    private lazy var cloudWidth = Int(viewWidth * 0.7)
    private lazy var cloudHeight = cloudWidth / 2
    private lazy var viewMaxX = Int(self.frame.maxX)
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
        self.animateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.firstCloud)
        self.addSubview(self.secondCloud)
        self.addSubview(self.thirdCloud)
        self.addSubview(self.fourthCloud)
        
        let firstStartRect = CGRect(
            x: 0 - cloudWidth,
            y: viewMidY - cloudHeight / 2,
            width: cloudWidth,
            height: cloudHeight
        )
        let secondStartRect = CGRect(
            x: 0 - cloudWidth,
            y: viewMidY + cloudHeight / 3,
            width: cloudWidth,
            height: cloudHeight
        )
        
        self.firstCloud.frame = firstStartRect
        self.secondCloud.frame = secondStartRect
        self.thirdCloud.frame = firstStartRect
        self.fourthCloud.frame = secondStartRect
    }
    
    private func animateViews() {
        let firstEndRect = firstCloud.frame.moveToX(viewMaxX + cloudWidth)
        let secondEndRect = secondCloud.frame.moveToX(viewMaxX + cloudWidth)
        
        self.firstCloud.animateCloud(duration: 15, delay: 0, endRect: firstEndRect)
        self.secondCloud.animateCloud(duration: 12, delay: 4, endRect: secondEndRect)
        self.thirdCloud.animateCloud(duration: 12, delay: 8, endRect: firstEndRect)
        self.fourthCloud.animateCloud(duration: 15, delay: 12, endRect: secondEndRect)
    }
}

private extension UIImageView {
    func animateCloud(duration: TimeInterval, delay: TimeInterval, endRect: CGRect) {
        UIView.animate(withDuration: duration, delay: delay, options: [.repeat, .curveLinear]) {
            self.frame = endRect
        }
    }
}

