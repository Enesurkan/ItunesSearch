//
//  ViewController.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    @IBOutlet weak var headerFilterView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    let headerFilter = HeaderFilterView.loadFromNib()
    var viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    var section : BehaviorRelay<[SearchSectionModel]> = BehaviorRelay(value: [])
    let dummyHeaderTitle = ["Movies","Music","Apps","Books"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        bindCollectionViewToPage()
        subscribeSearchTextField()
        setupHeaderView()
    }

}

