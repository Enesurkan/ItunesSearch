//
//  SearchViewController+TableView.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator
import Reusable
import PINRemoteImage

extension SearchViewController {
    
    internal func bindCollectionViewToPage(){
        registerCollectionViewCells()
        subscribeService()
        initializeCollectionView()
        setCollectionLayout()
        selectItem()
    }
    
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:10,left:10,bottom:10,right:10)
        layout.itemSize = CGSize(width: (self.view.bounds.width / 2) - 20,
                                 height: ((self.view.bounds.width / 2) - 20) * 1.7)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionView.collectionViewLayout = layout
    }
    
    private func initializeCollectionView() {
        setupCollectionViewDataBinding()
    }
    
    func subscribeService(){
        viewModel.searchData.subscribe(onNext: {[weak self] (searchItem) in
            guard let self = self,
                let searchData = searchItem
            else {return}
            self.setSection(searchData)
        }).disposed(by: disposeBag)
    }
    
    func setSection(_ data: [SearchItem]){
        self.section.accept(self.searchDefineSection(_model: data))
    }
    
    internal func registerCollectionViewCells(){
        collectionView.register(cellType: SearchCell.self)

    }
    
    internal func dataSource() -> RxCollectionViewSectionedReloadDataSource<SearchSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<SearchSectionModel>(
            configureCell: { (dataSource, collection, indexPath, _) in
                switch dataSource[indexPath] {
                case .SearchSectionItem(let data):
                    let cell = collection.dequeueReusableCell(for: indexPath, cellType: SearchCell.self)
                    cell.setupUI(data)
                    return cell
                }
            }
        )
    }
    
    private func setupCollectionViewDataBinding(){
        self.section.bind(to: collectionView.rx.items(dataSource: dataSource()))
            .disposed(by: disposeBag)
    }
    
    func selectItem(){
       collectionView
        .rx
        .itemSelected
            .subscribe(onNext:{[weak self] indexPath in
                guard let self = self else {return}
                print(indexPath)
                guard let _data = self.viewModel.searchData.value else {return}
                let index = (indexPath.section * 2) + indexPath.row
                self.pushDetailVC(_data[index])
            }).disposed(by: disposeBag)
        
        collectionView
            .rx
            .willDisplayCell
            .subscribe(onNext: {[weak self] (cell, indexPath) in
            guard let self = self else {return}
            let itemIndex = (indexPath.section * 2) + indexPath.row
            if itemIndex == (self.section.value.count * 2) - 1 {
                self.updateNextSet()
            }
        }).disposed(by: disposeBag)
    }
    
    func updateNextSet(){
        viewModel.setLimit()
    }
    
    func pushDetailVC(_ data: SearchItem){
        let vc = UIStoryboard.init(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.data = data
        self.present(vc, animated: true, completion: nil)
    }
}
