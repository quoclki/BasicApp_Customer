//
//  CustomerVCtrl.swift
//  CustomerCare_Customer
//
//  Created by quoclki on 7/31/16.
//  Copyright © 2016 quoclki. All rights reserved.
//

import UIKit
import BasicApp_Base

public class CustomerVCtrl: CustomerBaseVCtrl {

    // MARK: - Outlet
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vData: UIView!
    @IBOutlet weak var clvBar: UICollectionView!
    
    // MARK: - Private properties
    private var customerBarData: [CustomerBarItem] = []
    private var vSeperate: UIView!
    private var clvBarSource: ClvBarSource!
    
    // MARK: - Properties
    
    // MARK: - Init
    
    // MARK: - UIViewController func
    
    // MARK: - Func
    override public func loadData() {
        super.loadData()
        
    }
    
    func createCustomerBarData() {
        var item = CustomerBarItem()
        item.id = "1"
        item.name = "Group"
        item.viewController = CustomerGroupVCtrl()
        customerBarData.append(item)
        
        item = CustomerBarItem()
        item.id = "2"
        item.name = "Contact"
        item.viewController = CustomerContactVCtrl()
        customerBarData.append(item)
        
        item = CustomerBarItem()
        item.id = "3"
        item.name = "Management"
        item.viewController = CustomerManagementVCtrl()
        customerBarData.append(item)
        
        item = CustomerBarItem()
        item.id = "4"
        item.name = "Scheduling"
        item.viewController = CustomerSchedulingVCtrl()
        customerBarData.append(item)
        
        item = CustomerBarItem()
        item.id = "5"
        item.name = "ABCXYZ"
        item.viewController = CustomerGroupVCtrl()
        customerBarData.append(item)
    }
    
    // MARK: - Layout UI
    override public func configUI() {
        super.configUI()
        createCustomerBarData()
        
        clvBarSource = ClvBarSource(clv: clvBar, lstBar: customerBarData)
        clvBarSource.delegate = self

        let itemSize = CGSize(width: self.view.width / 4, height: 45)
        let layout = CollectionViewLayout(size: itemSize, scrollType: .Horizontal)
        clvBar.setCollectionViewLayout(layout, animated: true)
        
        CustomerBaseVCtrl.vData = vData
        
    }
    
    override public func configUIViewWillAppear() {
        super.configUIViewWillAppear()
        
    }
    
    // MARK: - Event Listerner
    override public func eventListener() {
        super.eventListener()
        
    }
    
    // MARK: - Event Handler

}

extension CustomerVCtrl: CollectionViewBarDelegate {
    func selectBarItem(barItem: CustomerBarItem) {
        vData.cleanSubViews()
        
        let vCtrl = barItem.viewController
        vCtrl.view.alpha = 0.5
        vCtrl.view.frame = vData.bounds
        addChildViewController(vCtrl)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            vCtrl.view.alpha = 1
        })
        
        self.vData.addSubview(vCtrl.view)
    }
}
