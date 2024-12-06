//
//  FeedViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by Adam Zaatar on 12/3/24.
//

import Foundation

class FeedViewModel: ObservableObject{
    
    let service = TweetService()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets()
    }
}
