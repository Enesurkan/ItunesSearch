//
//  HeaderFilterView+CollectionView.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator
import Reusable

extension HeaderFilterView {
    
    internal func bindCollectionViewToPage(){
        registerCollectionViewCells()
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        initializeCollectionView()
    }
    
    private func initializeCollectionView() {
        setupCollectionViewDataBinding()
        
        headerData.subscribe(onNext: {[weak self] (parchmentData) in
            guard let _parchmentData = parchmentData,
                let self = self
                else {return}
            self.sections.accept(self.defineSections(data: _parchmentData,
                                                     selectIndex: self.headerDidSelect.value))
        }).disposed(by: disposeBag)
        
    }
    
    internal func registerCollectionViewCells(){
        collectionView.register(cellType: HeaderFilterCell.self)
    }
    
    internal func dataSource() -> RxCollectionViewSectionedReloadDataSource<HeaderFilterSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<HeaderFilterSectionModel>(
            configureCell: { (dataSource, collection, indexPath, _) in
                switch dataSource[indexPath] {
                case .HeaderSectionItem(_, let data):
                    let cell = collection.dequeueReusableCell(for: indexPath, cellType: HeaderFilterCell.self)
                    cell.setupUI(data)
                    return cell
                }
            }
        )
    }
    
    private func setupCollectionViewDataBinding(){
        self.sections.bind(to: collectionView.rx.items(dataSource: dataSource()))
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected.asObservable().subscribe(onNext: {[weak self] (indexPath) in
            guard let self = self else {return}
            let index = indexPath.section
            let data = self.headerData.value
            self.headerDidSelect.accept(index)
            self.sections.accept(self.defineSections(data: data ?? [],
                                                        selectIndex: index))
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }).disposed(by: disposeBag)
        
        clearButton.rx.tap.bind{[weak self] _ in
            guard let self = self else {return}
            let data = self.headerData.value
            self.headerDidSelect.accept(nil)
            self.clearButtonTapped.accept(true)
            self.sections.accept(self.defineSections(data: data ?? [],
                                                        selectIndex: nil))
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: disposeBag)
    }
    
    func selectItem(_ index: Int){
        guard let parchmentData = self.headerData.value else {return}
        let indexPath = IndexPath(row: 0, section: index)
        self.sections.accept(self.defineSections(data: parchmentData, selectIndex: index))
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension HeaderFilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.sections.value[indexPath.first!].estimatedWidth, height: self.bounds.height - 4 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}
