//
//  WeatherCollectionViewCell.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 20.07.2024.
//

import UIKit

final class WeatherCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .white
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.font = UIFont(name: "ChalkboardSE-Light", size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//  MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
        self.textLabel.text = nil
    }
    
//    MARK: Setups
    func setup(with weather: WeatherTypes) {
        self.imageView.image = weather.icon
        self.textLabel.text = String(localized: weather.string)
    }
    
    private func setupViews(){
        self.addSubview(self.imageView)
        self.addSubview(self.textLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 80),
            self.imageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.textLabel.centerYAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
//            self.textLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
