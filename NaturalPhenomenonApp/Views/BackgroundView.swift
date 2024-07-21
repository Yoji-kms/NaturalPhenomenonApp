//
//  BackgroundView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 20.07.2024.
//

import UIKit

final class BackgroundView: UIView {
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.view)
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setup(with view: UIView) {
        self.view = view
    }
}
