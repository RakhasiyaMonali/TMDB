//
//  MovieListTableViewCell.swift
//  TMDB
//
//  Created by Monali on 06/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imhMovieLogo: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
