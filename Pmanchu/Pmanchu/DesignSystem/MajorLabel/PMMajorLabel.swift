import Foundation
import UIKit
import SnapKit
import Then

enum MLType {
    case front
    case back
    case devops
    case ios
    case aos
    case flutter
    case embedded
    case game
    case design
    case security
    case ai
    
    var text: String {
        switch self {
        case .front:
            return "Front-end"
        case .back:
            return "Back-end"
        case .devops:
            return "DevOps"
        case .ios:
            return "iOS"
        case .aos:
            return "AOS"
        case .flutter:
            return "Flutter"
        case .embedded:
            return "Embedded"
        case .game:
            return "Game"
        case .design:
            return "Design"
        case .security:
            return "Security"
        case .ai:
            return "AI"
        }
    }
    
    
    
    class PMMajorLabel: UILabel {
        
        
    }
}
