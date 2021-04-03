//
//  HomePageScreenTableViewCell.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit

class HomePageScreenTableViewCell: UITableViewCell {
    
    // MARK: - Constans
    
    private let notApplicableText = "N/A"
    
    // MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(imageViewUrl: String, titleText: String, imdbText: String, yearText: String, typeText: String) {
        
        self.titleLabel.text = titleText
        self.imdbLabel.text = imdbText
        self.yearLabel.text = yearText
        self.typeLabel.text = typeText
    }
    
}
