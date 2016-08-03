//
//  ClvBarSource.swift
//  BasicApp_Customer
//
//  Created by quoclki on 8/2/16.
//  Copyright © 2016 quoclki. All rights reserved.
//

import UIKit

class ClvBarSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var lstBar: [CustomerBarItem] = []
    var cellID = "clvBarCellID"
    var delegate: CollectionViewBarDelegate?
    
    init(clv: UICollectionView, lstBar: [CustomerBarItem]) {
        super.init()
        clv.registerNib(UINib(nibName: String(ClvBarCell), bundle: NSBundle(forClass: self.dynamicType)), forCellWithReuseIdentifier: cellID)
        self.lstBar = lstBar
        clv.dataSource = self
        clv.delegate = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lstBar.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! ClvBarCell
        cell.updateCell(lstBar[indexPath.row])
        cell.delegate = self.delegate
        
        return cell
    }

}
