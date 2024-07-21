//
//  SunWithCloudsView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 18.07.2024.
//

import UIKit

final class SunWithCloudsView: UIView {
//    MARK: Views
    private lazy var sunView: SunView = {
        let sunView = SunView()
        sunView.backgroundColor = .clear
        sunView.translatesAutoresizingMaskIntoConstraints = false
        return sunView
    }()
    
    private lazy var cloudsView: CloudsView = {
        let cloudsView = CloudsView(frame: self.frame)
        
        cloudsView.translatesAutoresizingMaskIntoConstraints = false
        return cloudsView
    }()
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cloudy
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.sunView)
        self.addSubview(self.cloudsView)
        
        NSLayoutConstraint.activate([
            self.sunView.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            self.sunView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.sunView.heightAnchor.constraint(equalTo: self.widthAnchor),
            self.sunView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            self.cloudsView.topAnchor.constraint(equalTo: self.topAnchor),
            self.cloudsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cloudsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.cloudsView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
