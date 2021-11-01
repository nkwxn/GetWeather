//
//  StoryBundle.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 28/10/21.
//

import Foundation

// Model and Sample Stories
struct TriggerAreaBundle: Identifiable {
    var id = UUID().uuidString
    var areaName: String
    var areaImage: String
    var isSeen: Bool = false
    var contents: [Content]
}

struct Content: Identifiable {
    var id = UUID().uuidString
    var imageURL: String
}
