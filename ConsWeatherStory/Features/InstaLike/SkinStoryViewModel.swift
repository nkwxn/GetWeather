//
//  SkinStoryViewModel.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 28/10/21.
//

import Foundation

class SkinStoryViewModel: ObservableObject {
    // List of stories...
    @Published var triggerAreas: [TriggerAreaBundle] = [
        TriggerAreaBundle(
            areaName: <#T##String#>,
            areaImage: <#T##String#>,
            contents: <#T##[Content]#>
        ),
        TriggerAreaBundle(
            areaName: <#T##String#>,
            areaImage: <#T##String#>,
            contents: <#T##[Content]#>
        )
    ]
}
