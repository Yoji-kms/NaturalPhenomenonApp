//
//  StormView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 19.07.2024.
//

import UIKit

final class StormView: UIView {
    private lazy var cloudsWithPrecipitationView: CloudsWithPrecipitationView = {
        let view = CloudsWithPrecipitationView(
            frame: self.frame,
            cloudsType: .black,
            presipitationsType: .rain
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lightninsView: LightningsView = {
        let frame = CGRect(
            x: self.frame.minX,
            y: self.frame.minY,
            width: self.frame.width,
            height: self.frame.height / 2
        )
        let view = LightningsView(frame: frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .storm
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Setups
    private func setupViews() {
        self.addSubview(self.cloudsWithPrecipitationView)
        self.addSubview(self.lightninsView)
        
        NSLayoutConstraint.activate([
            self.cloudsWithPrecipitationView.topAnchor.constraint(equalTo: self.topAnchor),
            self.cloudsWithPrecipitationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cloudsWithPrecipitationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.cloudsWithPrecipitationView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.lightninsView.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -1),
            self.lightninsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lightninsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lightninsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
        
    }
}
