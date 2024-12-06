//
//  RoundedShape.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 11/3/24.
//
import SwiftUI
import Foundation
import SwiftUICore
import UIKit
struct RoundedShape: Shape{
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
