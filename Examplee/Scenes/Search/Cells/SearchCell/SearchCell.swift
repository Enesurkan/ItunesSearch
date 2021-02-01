//
//  SearchCell.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import Reusable
import PINRemoteImage

class SearchCell: UICollectionViewCell, NibReusable {
    

    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawUI()
    }
    
    func setupUI(_ data: SearchItem){
        image.pin_setImage(from: URL(string: data.artworkUrl100 ?? "")!)
        nameLabel.text = data.wrapperType ?? ""
        releaseDateLabel.text = String().convertDateFormat(inputDate: data.releaseDate ?? "")
        priceLabel.text = "\(data.collectionPrice ?? 0.00)"
        imageViewHeight.constant = self.frame.size.width
    }
    
    func drawUI(){
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.borderWidth = 1
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 3, height: 3)
        backView.layer.shadowOpacity = 0.3
        backView.layer.cornerRadius = 16
        backView.layer.shadowRadius = 16
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        drawUI()
    }

}
