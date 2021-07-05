//
//  ItemTableViewCell.swift
//  TestNisum
//
//  Created by Uriel Martinez on 04/07/2021.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var freqLabel: UILabel!
    @IBOutlet weak var sinceLabel: UILabel!
    @IBOutlet weak var varsLabel: UILabel!
    
    var acromine: LF?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(acromine: LF) {
        self.acromine = acromine
        titleLabel.text = acromine.lf
        freqLabel.text = "\(acromine.freq)"
        sinceLabel.text = "\(acromine.since)"
        varsLabel.text = "\(acromine.vars!.count)"
    }
    
}
