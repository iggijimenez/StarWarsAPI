//
//  PersonTableViewCell.swift
//  StarWarsAPI
//
//  Created by Jimenez on 9/28/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
