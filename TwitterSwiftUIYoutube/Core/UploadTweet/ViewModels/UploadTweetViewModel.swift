//
//  UploadTweetViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 12/3/24.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success{
                // dismiss screen somehow
                self.didUploadTweet = true
            } else {
                // show error message to user
            }
        }
    }
}
