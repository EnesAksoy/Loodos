//
//  HomePageScreenViewController.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit

class HomePageScreenViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchTextField: LoodosTextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Proporties
    
    private var viewModel: HomePageViewModel!
    private var searchModel: [SearchModel] = []
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomePageViewModel()
        self.viewModel.delegate = self
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        self.viewModel.serviceCallMethod(search: self.searchTextField.text!)
    }
    
    
}

    // MARK: - HomePageViewModelDelegate Extension Methods

extension HomePageScreenViewController: HomePageViewModelDelegate {
    func updateView(_ searchModel: [SearchModel]?, errorText: String) {
        self.searchModel.removeAll()
        if errorText != "" {
            LoadingView.removeLoadingView()
            //creat Alert
            return
        }
        if let searchModel = searchModel {
            self.searchModel = searchModel
        }else {
            // creat nil data
        }
        
        DispatchQueue.main.async {
            // tableview reload data
        }
        LoadingView.removeLoadingView()
    }
}
