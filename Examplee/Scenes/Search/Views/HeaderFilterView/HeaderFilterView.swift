//
//  HeaderFilterView.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

class HeaderFilterView: UIView, NibLoadable {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    let disposeBag = DisposeBag()
    var headerData : BehaviorRelay<[HeaderFilterDTO]?> = BehaviorRelay(value: nil)
    var sections: BehaviorRelay<[HeaderFilterSectionModel]> = BehaviorRelay(value: [])
    var headerDidSelect: BehaviorRelay<Int?> = BehaviorRelay(value: nil)
    var clearButtonTapped : BehaviorRelay<Bool?> = BehaviorRelay(value: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bindCollectionViewToPage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
