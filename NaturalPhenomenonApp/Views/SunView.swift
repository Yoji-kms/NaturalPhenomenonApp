//
//  SunView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 18.07.2024.
//

import UIKit

final class SunView: UIView {
//    MARK: Views
    private lazy var sunImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(resource: .sun)
        imageView.image = image
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .sunny
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.sunImageView)
        
        NSLayoutConstraint.activate([
            self.sunImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.sunImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.sunImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            self.sunImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)
        ])
        
        self.animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 25, delay: 0, options: [.repeat, .autoreverse]) {
            self.sunImageView.transform = CGAffineTransform(rotationAngle: .pi / 4)
            self.sunImageView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }
    }
}
