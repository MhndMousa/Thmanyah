//
//  Toast.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//



import Foundation
import Drops
import UIKit

class Toast{
    private enum ToastType{
        case success, informative, error
        
        var icon : UIImage?{
            switch self{
            case .error : return UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemRed)
            case .success : return UIImage(systemName: "checkmark.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemGreen)
            case .informative : return UIImage(systemName: "i.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemYellow)
            }
        }
    }
    
    
    private static let titleNumberOfLines = 0
    private static let subtitleNumberOfLines = 0
    private static let position : Drop.Position = .top
    private static let duration : Drop.Duration = .init(floatLiteral: 4.0)
    private static let action : Drop.Action = .init {
        Drops.hideCurrent()
    }
    
    
    static func informative(title: String = "Info", subtitle: String){
        show(title: title, subtitle: subtitle, type:.informative)
    }
    static func success(title: String = "Success", subtitle: String){
        show(title: title, subtitle: subtitle, type:.success)
    }
    static func error(title: String = "Error", subtitle: String){
        show(title: title, subtitle: subtitle, type:.error)
    }
    
    static private func show(title:String = "", subtitle: String = "", type: ToastType){
        let drop = Drop(
            title: title,
            titleNumberOfLines: titleNumberOfLines,
            subtitle: subtitle,
            subtitleNumberOfLines: subtitleNumberOfLines,
            icon: type.icon,
            action: action,
            position: position,
            duration: duration,
            accessibility: nil
        )
        
        Drops.show(drop)
    }
    
}
