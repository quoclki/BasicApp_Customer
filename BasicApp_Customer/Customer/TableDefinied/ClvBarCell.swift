//
//  ClvBarCell.swift
//  BasicApp_Customer
//
//  Created by quoclki on 8/2/16.
//  Copyright © 2016 quoclki. All rights reserved.
//

import UIKit
import BasicApp_Base

class ClvBarCell: UICollectionViewCell {

    // MARK: - Outlet
    @IBOutlet weak var btnBarItem: UIButton!
    
    // MARK: - Private properties
    
    // MARK: - Properties
    var barItem: CustomerBarItem!
    var delegate: CollectionViewBarDelegate?
    
    // MARK: - Init
    
    // MARK: - UICollectionView func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Func
    func updateCell(barItem: CustomerBarItem) {
        btnBarItem.setTitle(barItem.name, forState: .Normal)
        btnBarItem.touchUpInside({sender in self.btnBarItem_Touch(sender)})
        self.barItem = barItem
    }
    
    // MARK: - Layout UI
    
    // MARK: - Event Listerner
    
    // MARK: - Event Handler
    func btnBarItem_Touch(sender: UIButton) {
        let clv = self.superview as! UICollectionView
        let indexPath = clv.indexPathForCell(self)
        clv.scrollToItemAtIndexPath(indexPath!, atScrollPosition: .CenteredHorizontally, animated: true)
        
        delegate?.selectBarItem(barItem)
    }
}
