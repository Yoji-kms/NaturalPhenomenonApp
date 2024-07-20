//
//  ViewController.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 16.07.2024.
//

import UIKit

class ViewController: UIViewController {
    private lazy var backgroundImage: UIView = {
        let view = ThunderView(frame: self.view.frame)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        self.setupViews()
    }
    
    private func setupViews() {
        self.view.addSubview(self.backgroundImage)
        
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundImage.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.backgroundImage.heightAnchor.constraint(equalTo: self.view.heightAnchor),
        ])
    }
}

