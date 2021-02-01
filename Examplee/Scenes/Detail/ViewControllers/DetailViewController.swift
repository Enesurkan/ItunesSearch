//
//  DetailViewController.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import PINRemoteImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productHeight: NSLayoutConstraint!
    
    var data: SearchItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        guard let _data = data else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        productHeight.constant = productImage.frame.width
        productImage.pin_setImage(from: URL(string: _data.artworkUrl100 ?? "")!)
        price.text = "\(_data.collectionPrice ?? 0.00)"
        currency.text = _data.currency ?? ""
        country.text = _data.country ?? ""
        releaseDate.text = String().convertDateFormat(inputDate: _data.releaseDate ?? "")
        productName.text = _data.collectionName ?? ""
    }

}
