//
//  SettingsTableViewCell.swift
//  Dz_10
//
//  Created by Nick on 08.07.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.airplaneSwitch.isHidden = true
        self.attributeLabel.text = ""
        self.accessoryType = .disclosureIndicator
    }
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.layer.cornerRadius = iconImageView.bounds.width / 4.5
        }
    }
    @IBOutlet weak var airplaneSwitch: UISwitch!
    @IBOutlet weak var badgeLabel: UILabel! {
        didSet {
            badgeLabel.layer.masksToBounds = true
            badgeLabel.layer.cornerRadius = badgeLabel.bounds.height / 1.65
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
