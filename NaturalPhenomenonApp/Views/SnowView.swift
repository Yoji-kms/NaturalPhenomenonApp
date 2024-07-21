//
//  SnowView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 20.07.2024.
//

import UIKit

final class SnowView: UIView {
    private lazy var snowView = {
        let image = UIImage(resource: .rainDrop)
        let view = CloudsWithPrecipitationView(
            frame: self.frame,
            cloudsType: .greyAndWite,
            presipitationsType: .snow)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    MARK: Lifecycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .snow
        self.setupViews()
    }
    
    private func setupViews() {
        self.addSubview(self.snowView)
        
        NSLayoutConstraint.activate([
            self.snowView.topAnchor.constraint(equalTo: self.topAnchor),
            self.snowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.snowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.snowView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

