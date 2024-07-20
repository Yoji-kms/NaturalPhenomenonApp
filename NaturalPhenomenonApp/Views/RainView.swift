//
//  RainView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 20.07.2024.
//

import UIKit

final class RainView: UIView {
    private lazy var rainView = {
        let image = UIImage(resource: .rainDrop)
        let view = CloudsWithPrecipitationView(
            frame: self.frame,
            cloudsType: .grey,
            presipitationsType: .rain)
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
        self.backgroundColor = .clear
        self.setupViews()
    }
    
    private func setupViews() {
        self.addSubview(self.rainView)
        
        NSLayoutConstraint.activate([
            self.rainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.rainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.rainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.rainView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
