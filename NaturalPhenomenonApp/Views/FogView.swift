//
//  FogView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 18.07.2024.
//

import UIKit

final class FogView: UIView {
//    MARK: Views
    private lazy var clouds = [UIImageView]()
    
//    MARK: Variables
    private lazy var viewWidth = Int(self.frame.width)
    private lazy var viewHeight = Int(self.frame.height)
//    private lazy var viewMidY = Int(self.frame.midY)
//    private lazy var viewMaxX = Int(self.frame.maxX)
//    private lazy var viewMidX = Int(self.frame.midX)
//    private lazy var viewMaxY = Int(self.frame.maxY)
    
    private lazy var cloudWidth = viewWidth
    private lazy var cloudHeight = viewHeight / 3
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray3
        self.setupViews()
        self.animateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Setups
    private func setupViews() {
        self.setupCloudsViews()
    }
    
    private func setupCloudsViews() {
        let whiteImage = UIImage(resource: .whiteCloud)
        let greyImage = UIImage(resource: .greyCloud)
        let cloudImages = [whiteImage, greyImage]
        
//        self.clouds.append(contentsOf: [
//            UIImageView(image: greyImage),
//            UIImageView(image: whiteImage),
//            UIImageView(image: greyImage),
//            UIImageView(image: whiteImage),
//            UIImageView(image: whiteImage)
//        ])
        
        let cloudsAtRow = 3
        let cloudsAtColumn = 5
        
        print("🟡 Frame size \(self.frame.size)")
        
        let horizontalSpacing: Int = Int(self.viewWidth) / (cloudsAtRow + 1)
        let verticalSpacing: Int = Int(self.viewHeight) / (cloudsAtColumn + 1)
        
        for rowIndex in 0..<cloudsAtRow {
            let x = horizontalSpacing * rowIndex - self.cloudWidth / 2
            
            for columnIndex in 0...cloudsAtColumn {
                let cloudImageIndex = Int.random(in: 0...1)
                let cloudView = UIImageView(image: cloudImages[cloudImageIndex])
                cloudView.layer.opacity = 0.2
                
                let y = verticalSpacing * columnIndex - self.cloudHeight / 2
                
                let cloudStartRect = cloudRect(x: x, y: y)
                
                cloudView.frame = cloudStartRect
                
                self.clouds.append(cloudView)
                self.addSubview(cloudView)
            }
        }
    }
    
    private func animateViews() {
        self.animateCloudsViews()
    }
    
    private func animateCloudsViews() {
        self.clouds.forEach { cloud in
            let endRect = cloud.frame.moveToX(Int(cloud.frame.minX + 30))
            let duration = Double.random(in: 5...10)
            cloud.animateCloud(duration: duration, endRect: endRect)
        }
    }
    
    private func cloudRect(x: Int, y: Int) -> CGRect {
        return CGRect(
            x: x,
            y: y,
            width: self.cloudWidth,
            height: self.cloudHeight
        )
    }
}

private extension UIImageView {
    func animateCloud(duration: TimeInterval, endRect: CGRect) {
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse]) {
            self.frame = endRect
            self.layer.opacity = 0.6
        }
    }
}
