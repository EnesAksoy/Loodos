//
//  HomePageViewModel.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation

class HomePageViewModel: NSObject {
    
    // MARK: - Delegate
    
    var delegate: HomePageViewModelDelegate?
    
    // MARK: - Properties
    
    private var apiService: APIService!
    
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    func serviceCallMethod(search: String) {
        LoadingView.showLoadingView()
        let searchText = search.replacingOccurrences(of: " ", with: "")
        apiService.apiToSearchData(search: searchText) { (searchModel, error)  in
            self.delegate?.updateView(searchModel, errorText: error)
        }
    }
}
