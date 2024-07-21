//
//  ViewController.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 16.07.2024.
//

import UIKit

class ViewController: UIViewController {
//    MARK: Views
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(
            WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCollectionViewCell"
        )
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherViews: [UIView] = {
        var views = [UIView]()
        weatherTypes.forEach{ weatherType in
            let weatherView = weatherType.view(frame: self.view.bounds)
            weatherView.layer.opacity = 0
            views.append(weatherView)
        }
        return views
    }()
    
    private lazy var sunView = WeatherTypes.sunny.view(frame: self.view.bounds)
    private lazy var cloudView = WeatherTypes.cloudy.view(frame: self.view.bounds)
    
    private let weatherTypes = WeatherTypes.allCases
    private lazy var currentWeatherTypeIndex = Int.random(in: 0..<weatherTypes.count)
    
//    MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.setupViews()
    }
    
//    MARK: Setups
    private func setupViews() {
        self.view.addSubview(self.backgroundView)
        
        self.weatherViews.forEach { weatherView in
            self.backgroundView.addSubview(weatherView)
        }
        print(currentWeatherTypeIndex)
        self.weatherViews[currentWeatherTypeIndex].layer.opacity = 1
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.backgroundView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherType = weatherTypes[indexPath.row]
        
        if weatherType.index != currentWeatherTypeIndex {
            if self.weatherViews[weatherType.index].layer.opacity == 0 {
                self.weatherViews[weatherType.index].layer.opacity = 1
            }
            
            UIView.transition(
                from: self.weatherViews[self.currentWeatherTypeIndex],
                to: self.weatherViews[weatherType.index],
                duration: 2,
                options: [.showHideTransitionViews, .transitionCrossDissolve, .allowUserInteraction]
            )
            
            self.currentWeatherTypeIndex = weatherType.index
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath
        ) as? WeatherCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.setup(with: weatherTypes[indexPath.row])
        
        return cell
    }
}


