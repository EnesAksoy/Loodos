//
//  HomePageScreenViewController.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit

class HomePageScreenViewController: UIViewController {
    
    //MARK: - Constants
    
    private let tableViewCellId = "HomePageScreenTableViewCell"
    private let messageErrorTitleLocalizableKey = "messageErrorTitle"
    private let warningTextLocalizableKey = "homePageScreen.warningText"
    private let noMovieText = "homePageScreen.noMovieText"
    
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
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: self.tableViewCellId, bundle: nil), forCellReuseIdentifier: self.tableViewCellId)
        self.tableView.reloadData()
    }

    // MARK: - Actions
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        self.view.endEditing(true)
        if self.searchTextField.text == "" {
            self.createAlert(message: self.localizableGetString(forkey: warningTextLocalizableKey), title: self.localizableGetString(forkey: messageErrorTitleLocalizableKey))
            return
        }
        self.viewModel.serviceCallMethod(search: self.searchTextField.text!)
    }
}

    // MARK: - HomePageViewModelDelegate Extension Methods

extension HomePageScreenViewController: HomePageViewModelDelegate {
    func updateView(_ searchModel: [SearchModel]?, errorText: String) {
        self.searchModel.removeAll()
        if errorText != "" {
            LoadingView.removeLoadingView()
            self.tableView.reloadData()
            self.createAlert(message: errorText, title: self.localizableGetString(forkey: self.messageErrorTitleLocalizableKey))
            return
        }
        if let searchModel = searchModel {
            self.searchModel = searchModel
        }else {
            self.createAlert(message: self.localizableGetString(forkey: self.noMovieText), title: self.localizableGetString(forkey: self.messageErrorTitleLocalizableKey))
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        LoadingView.removeLoadingView()
    }
}

    // MARK: - UITableViewDataSource, UITableViewDelegate Methods

extension HomePageScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.searchModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.tableViewCellId, for: indexPath) as! HomePageScreenTableViewCell
        cell.configureCell(imageViewUrl: self.searchModel[indexPath.row].poster,
                                               titleText: self.searchModel[indexPath.row].title,
                                               imdbText: self.searchModel[indexPath.row].imdbID,
                                               yearText: self.searchModel[indexPath.row].year,
                                               typeText: self.searchModel[indexPath.row].type)
        return cell
    }
}
