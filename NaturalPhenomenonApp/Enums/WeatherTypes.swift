//
//  WeatherTypes.swift
//  NaturalPhenomenonApp
//
//  Created by Yoji on 20.07.2024.
//

import UIKit

enum WeatherTypes: CaseIterable {
    case sunny
    case cloudy
    case rain
    case snow
    case storm
    case fog
    
    var index: Int {
        switch self {
        case .sunny:
            return 0
        case .cloudy:
            return 1
        case .rain:
            return 2
        case .snow:
            return 3
        case .storm:
            return 4
        case .fog:
            return 5
        }
    }
    
    var string: String.LocalizationValue {
        switch self {
        case .sunny:
            return "Sunny"
        case .cloudy:
            return "Cloudy"
        case .rain:
            return "Rain"
        case .snow:
            return "Snow"
        case .storm:
            return "Storm"
        case .fog:
            return "Fog"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .sunny:
            return .sunnyIcon
        case .cloudy:
            return .cloudyIcon
        case .rain:
            return .rainIcon
        case .snow:
            return .snowIcon
        case .storm:
            return .stormIcon
        case .fog:
            return .fogIcon
        }
    }
    
    func view(frame: CGRect) -> UIView {
        switch self {
        case .sunny:
            return SunView(frame: frame)
        case .cloudy:
            return SunWithCloudsView(frame: frame)
        case .rain:
            return RainView(frame: frame)
        case .snow:
            return SnowView(frame: frame)
        case .storm:
            return StormView(frame: frame)
        case .fog:
            return FogView(frame: frame)
        }
    }
}
