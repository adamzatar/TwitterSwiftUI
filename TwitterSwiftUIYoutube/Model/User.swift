//
//  User.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 11/27/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseSharedSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    let uid: String
}
