//
//  PinController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class PinController: UIViewController{
    
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var pinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PinController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PinCell", for: indexPath) as! PinCell
        if indexPath.item == 10{
            cell.numberLabel.text = "0"
        }else if indexPath.item == 12{
            cell.numberLabel.text = ""
        }else if indexPath.item == 11{
            cell.numberLabel.text = "0"
        }else{
            cell.numberLabel.text = "\(indexPath.item + 1)"
        }
        
        return cell
    
    }
    
    
    
    
}
