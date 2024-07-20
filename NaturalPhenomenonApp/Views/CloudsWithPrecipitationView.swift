//
//  RainView.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 19.07.2024.
//

import UIKit

final class CloudsWithPrecipitationView: UIView {
//    MARK: Views
    private lazy var clouds = [UIImageView]()
    
//    MARK: Variables
    private lazy var viewWidth = Int(self.frame.width)
    private lazy var viewHeight = Int(self.frame.height)
    private lazy var viewMidY = Int(self.frame.midY)
    private lazy var viewMaxX = Int(self.frame.maxX)
    private lazy var viewMidX = Int(self.frame.midX)
    private lazy var viewMaxY = Int(self.frame.maxY)
    
    private lazy var cloudWidth = viewWidth * 7 / 10
    private lazy var cloudHeight = cloudWidth / 2
    
    private let cloudsType: Clouds
    private let presipitationsType: Precipitations
    
//    MARK: Lifecycle
    init(frame: CGRect, cloudsType: Clouds, presipitationsType: Precipitations) {
        self.cloudsType = cloudsType
        self.presipitationsType = presipitationsType
        
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
        self.animateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Setups
    private func setupViews() {
        self.setupRaindropViews()
        self.setupCloudsViews()
    }
    
    private func setupRaindropViews() {
        var precipitationImage = UIImage()
        switch self.presipitationsType {
        case .rain:
            precipitationImage = UIImage(resource: .rainDrop)
        case .snow:
            precipitationImage = UIImage(resource: .snowFlake)
        }
        
        let precipitations = PrecipitationView(
            frame: self.frame,
            precipitationImage: precipitationImage,
            precipitationCount: 20
        )
        
        self.addSubview(precipitations)
        
        let precipitationsHeight = (self.viewHeight / 2) + 10
        
        let precipitationsRect = CGRect(
            x: 0,
            y: self.viewMidY - 10,
            width: self.viewWidth,
            height: precipitationsHeight
        )
        
        precipitations.frame = precipitationsRect
    }
    
    private func setupCloudsViews() {
        switch cloudsType {
        case .grey:
            let image = UIImage(resource: .greyCloud)
            self.clouds.append(contentsOf: [
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image)
            ])
        case .greyAndWite:
            let whiteImage = UIImage(resource: .whiteCloud)
            let greyImage = UIImage(resource: .greyCloud)
            
            self.clouds.append(contentsOf: [
                UIImageView(image: greyImage),
                UIImageView(image: whiteImage),
                UIImageView(image: greyImage),
                UIImageView(image: whiteImage),
                UIImageView(image: whiteImage)
            ])
        case .black:
            let image = UIImage(resource: .blackCloud)
            self.clouds.append(contentsOf: [
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image),
                UIImageView(image: image)
            ])
        }
        
        let firstRowY = viewMidY - cloudHeight * 3 / 2
        let secondRowY = viewMidY - cloudHeight
        
        let cloudsStartRects = [
            cloudRect(x: 0, y: firstRowY),
            cloudRect(x: viewMidX - cloudWidth / 2, y: firstRowY),
            cloudRect(x: viewMaxX - cloudWidth, y: firstRowY),
            cloudRect(x: 0, y: secondRowY),
            cloudRect(x: viewMaxX - cloudWidth, y: secondRowY)
        ]
        
        for index in 0..<5 {
            self.addSubview(self.clouds[index])
            self.clouds[index].frame = cloudsStartRects[index]
            
        }
    }
    
    private func animateViews() {
        self.animateCloudsViews()
    }
    
    private func animateCloudsViews() {
        let firstCloudEndRect = clouds[0].frame.moveToX(Int(clouds[0].frame.minX - 20))
        let secondCloudEndRect = clouds[1].frame.moveToX(Int(clouds[1].frame.minX + 20))
        let thirdCloudEndRect = clouds[2].frame.moveToX(Int(clouds[2].frame.minX + 20))
        let fourthCloudEndRect = clouds[3].frame.moveToX(Int(clouds[3].frame.minX - 20))
        let fifthCloudEndRect = clouds[4].frame.moveToX(Int(clouds[4].frame.minX + 20))
        
        clouds[0].animateCloud(duration: 10, endRect: firstCloudEndRect)
        clouds[1].animateCloud(duration: 5, endRect: secondCloudEndRect)
        clouds[2].animateCloud(duration: 10, endRect: thirdCloudEndRect)
        clouds[3].animateCloud(duration: 7, endRect: fourthCloudEndRect)
        clouds[4].animateCloud(duration: 8, endRect: fifthCloudEndRect)
    }
    
    private func cloudRect(x: Int, y: Int) -> CGRect {
        return CGRect(
            x: x,
            y: y,
            width: self.cloudWidth,
            height: self.cloudHeight
        )
    }
}

private extension UIImageView {
    func animateCloud(duration: TimeInterval, endRect: CGRect) {
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse]) {
            self.frame = endRect
        }
    }
}
