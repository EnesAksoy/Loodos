//
//  HomePageScreenTableViewCell.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit
import Kingfisher

class HomePageScreenTableViewCell: UITableViewCell {
    
    // MARK: - Constans
    
    private let viewBorderWidth: CGFloat = 1
    private let viewCornerRadius: CGFloat = 15
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.borderWidth = self.viewBorderWidth
        self.cellView.layer.borderColor = UIColor.lightGray.cgColor
        self.cellView.layer.cornerRadius = self.viewCornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(imageViewUrl: String, titleText: String, imdbText: String, yearText: String, typeText: String) {
        self.posterImageView.kf.setImage(with: URL(string: imageViewUrl))
        self.posterImageView.kf.indicatorType = .activity
        self.titleLabel.text = titleText
        self.imdbLabel.text = imdbText
        self.yearLabel.text = yearText
        self.typeLabel.text = typeText
    }
}
