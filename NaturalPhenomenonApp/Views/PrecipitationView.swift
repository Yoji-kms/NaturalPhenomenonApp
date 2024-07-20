//
//  PrecipitationView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 19.07.2024.
//

import UIKit

final class PrecipitationView: UIView {
    private lazy var precipitations = [UIImageView]()
    private let precipitationImage: UIImage
    
//    MARK: Variables
    private lazy var viewWidth = self.frame.width
    private lazy var viewHeight = self.frame.height
    private lazy var viewMaxX = Int(self.frame.maxX)
    private lazy var viewMaxY = Int(self.frame.maxY)
    
    private lazy var precipitationWidth = 10
    private let precipitationCount: Int
    
//    MARK: Lifecycle  
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, precipitationImage: UIImage, precipitationCount: Int) {
        self.precipitationImage = precipitationImage
        self.precipitationCount = precipitationCount
        
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.setupViews()
        self.animateViews()
    }
    
    private func setupViews(){
        let spacing: Int = Int(self.viewWidth) / (precipitationCount + 1)
        
        for index in 1...precipitationCount {
            let precipitationView = UIImageView(image: precipitationImage)
            let x = spacing * index
            precipitationView.frame = precipitationRect(x: x)
            
            self.addSubview(precipitationView)
            
            self.precipitations.append(precipitationView)
        }
    }
    
    private func animateViews(){
        self.precipitations.forEach { [weak self] precipitationView in
            guard let self else { return }
            
            let duration = Double.random(in: 2...4)
            
            precipitationView.animatePrecipitation(duration: duration, endY: self.viewMaxY)
        }
    }
    
    private func precipitationRect(x: Int) -> CGRect {
        return CGRect(
            x: x,
            y: 0,
            width: self.precipitationWidth,
            height: self.precipitationWidth)
    }
}

private extension UIImageView {
    func animatePrecipitation(duration: TimeInterval, endY: Int) {
        let endRect = self.frame.moveToY(endY)
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .curveEaseIn]) {
            self.frame = endRect
        }
    }
}
