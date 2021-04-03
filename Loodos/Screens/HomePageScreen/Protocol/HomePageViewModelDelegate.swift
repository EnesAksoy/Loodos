//
//  HomePageViewModelDelegate.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation

protocol HomePageViewModelDelegate {
    func updateView(_ searchModel: [SearchModel]?, errorText: String)
}
