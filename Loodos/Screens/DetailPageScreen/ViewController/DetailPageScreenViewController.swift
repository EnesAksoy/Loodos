//
//  DetailPageScreenViewController.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit
import Kingfisher

class DetailPageScreenViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(false, animated: true)
        self.updateView()
        
    }

    private func updateView() {
        let searchModel = ObjectStore.shared.detailData
        self.titleLabel.text = searchModel?.title
        self.imdbLabel.text = searchModel?.imdbID
        self.yearLabel.text = searchModel?.year
        self.typeLabel.text = searchModel?.type
        self.imageView.kf.setImage(with: URL(string: searchModel?.poster ?? ""))
        self.imageView.kf.indicatorType = .activity
    }

   

}
