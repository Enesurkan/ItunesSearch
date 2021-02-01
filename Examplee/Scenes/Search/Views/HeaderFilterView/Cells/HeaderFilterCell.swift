//
//  HeaderFilterCell.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import Reusable

class HeaderFilterCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawUI()
    }
    
    func setupUI(_ data: HeaderFilterDTO){
        let font = data.select ? data.selectTitleFont : data.unSelectTitleFont
        let backColor = data.select ? data.selectBackgroundColor : data.unSelectBackgroundColor
        self.backgroundColor = backColor
        self.label.font = font
        self.label.text = data.title ?? ""
    }
    
    func drawUI(){
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        drawUI()
    }

}
