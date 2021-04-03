//
//  DetailPageScreenViewModel.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import FirebaseAnalytics

class DetailPageScreenViewModel: NSObject {
    
    // MARK: - Constans
    
    private let eventName: String = "DetailScreen"
    
    override init() {
        super.init()
    }
    
    func firebaseAnalytics(detailData: SearchModel?) {
        let parameter = ["title": detailData?.title, "year": detailData?.year, "imdb": detailData?.imdbID, "type": detailData?.type]
        Analytics.logEvent(self.eventName, parameters: parameter as [String : Any])
    }
}
