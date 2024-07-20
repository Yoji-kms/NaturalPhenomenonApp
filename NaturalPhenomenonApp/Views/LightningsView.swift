//
//  LightningsView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 19.07.2024.
//

import UIKit

final class LightningsView: UIView {
    private lazy var lightnings = [UIImageView]()
    
//    MARK: Lifecycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
        self.animateViews()
    }
    
    private func setupViews(){
        let bigLightningImage = UIImage(resource: .bigLightning)
        let bigLightningHeight = self.frame.height / 2
        let bigLightningWidth: CGFloat = 30
        
        
        let smallLightningImage = UIImage(resource: .smallLightning)
        let smallLightningHeight = self.frame.height / 5
        let smallLightningWidth: CGFloat = 10
        
        let secondRowTopPadding = self.frame.height / 2
        
        self.setupLightningsRow(
            image: bigLightningImage,
            topPadding: 0,
            count: 3,
            width: bigLightningWidth,
            height: bigLightningHeight
        )
        self.setupLightningsRow(
            image: smallLightningImage,
            topPadding: secondRowTopPadding,
            count: 4,
            width: smallLightningWidth,
            height: smallLightningHeight
        )
    }
    
    private func setupLightningsRow(
        image: UIImage,
        topPadding: CGFloat,
        count: Int,
        width: CGFloat,
        height: CGFloat) {
        let spacing: Int = Int(self.frame.width) / (count + 1)
        
        for index in 1...count {
            let lightningView = UIImageView(image: image)
            lightningView.translatesAutoresizingMaskIntoConstraints = false
            lightningView.layer.opacity = 0
            let x = CGFloat(spacing * index)
            
            self.addSubview(lightningView)
            
            NSLayoutConstraint.activate([
                lightningView.topAnchor.constraint(equalTo: self.topAnchor, constant: topPadding),
                lightningView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: x),
                lightningView.widthAnchor.constraint(equalToConstant: width),
                lightningView.heightAnchor.constraint(equalToConstant: height)
            ])
            
            self.lightnings.append(lightningView)
        }
    }
    
    private func animateViews(){
        lightnings.forEach { bigLightning in
            let duration = Double.random(in: 1...2)
            let delay = Double.random(in: 0...2)
            UIView.animate(withDuration: duration, delay: delay, options: [.repeat, .curveEaseIn]) {
                bigLightning.layer.opacity = 1
            }
        }
    }
}
