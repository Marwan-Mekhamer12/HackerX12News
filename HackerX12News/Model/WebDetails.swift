//
//  WebDetails.swift
//  HackerX12News
//
//  Created by Marwan Mekhamer on 24/04/2025.
//

import Foundation


struct WebDetails: Codable {
    
    let hits: [Post]
    
}


struct Post: Codable {
    let title: String
    let url: String?
    let points: Int
    
}
