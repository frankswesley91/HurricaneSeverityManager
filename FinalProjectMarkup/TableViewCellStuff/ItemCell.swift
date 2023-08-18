//
//  ItemCell.swift
//  FinalProjectMarkup
//
//  Created by Wesley Franks on 4/25/23.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemBubble.layer.cornerRadius = itemBubble.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
