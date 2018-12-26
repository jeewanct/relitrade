//
//  HeaderView.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class HomeHeader: UICollectionReusableView{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var stockValue: [HomeShareEntity]?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setup(){
        collectionView.register(UINib(nibName: "HeaderShareCell", bundle: nil), forCellWithReuseIdentifier: "HeaderShareCell")
    }
    
}

extension HomeHeader: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderShareCell", for: indexPath) as! HeaderShareCell
        if let shareData = stockValue{
            cell.stockValue = shareData[indexPath.item]
        }
        return cell
    }
    
}
