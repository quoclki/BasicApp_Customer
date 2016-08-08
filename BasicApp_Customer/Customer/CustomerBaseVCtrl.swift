//
//  CustomerBaseVCtrl.swift
//  CustomerCare_Customer
//
//  Created by quoclki on 8/1/16.
//  Copyright © 2016 quoclki. All rights reserved.
//

import Foundation
import BasicApp_Base

public class CustomerBaseVCtrl: BaseVCtrl {

    // MARK: - Outlet
    
    // MARK: - Private properties

    // MARK: - Properties
    public static var vTop: UIView!
    public static var vData: UIView!
    
    // MARK: - Init
    
    // MARK: - UIViewController func
    
    // MARK: - Func
    func createButtonSave() {
        let btnSave = UIButton()
        btnSave.frame = CGRect(x: 0, y: CustomerBaseVCtrl.vData.height - 40, width: CustomerBaseVCtrl.vData.width, height: 40)
        btnSave.setTitle("Save", forState: .Normal)
        btnSave.backgroundColor = UIColor.yellowColor()
        btnSave.touchUpInside({sender in self.btnSave_Touch(sender)})
        
        view.addSubview(btnSave)
    }
    
    func createMiniBar(haveBackButton: Bool = false) {
        let vBar = UIView()
        vBar.frame = CGRect(x: 0, y: 0, width: CustomerBaseVCtrl.vData.width, height: 40)
        vBar.backgroundColor = UIColor.yellowColor()
        
        view.addSubview(vBar)
        
        if haveBackButton {
            let btnBack = UIButton()
            btnBack.backgroundColor = UIColor.blueColor()
            btnBack.setTitle("Back", forState: .Normal)
            btnBack.touchUpInside({sender in self.popVCtrl()})
            btnBack.frame = CGRect(x: 0, y: 0, width: 40, height: vBar.frame.height)
            
            view.addSubview(btnBack)
        }
        
    }
    
    func createButtonAdd() {
        let btnAdd = UIButton()
        btnAdd.frame = CGRect(x: CustomerBaseVCtrl.vTop.frame.width - 50, y: 20, width: 50, height: 50)
        btnAdd.setImage(UIImage(named: "customer-plus", inBundle: NSBundle(forClass: self.dynamicType), compatibleWithTraitCollection: nil), forState: .Normal)
        btnAdd.touchUpInside({sender in self.btnAdd_Touch(sender)})
        CustomerBaseVCtrl.vTop.addSubview(btnAdd)
    }
    
    
    
    // MARK: - Layout UI
    
    // MARK: - Event Listerner
    
    // MARK: - Event Handler
    func btnSave_Touch (sender: UIButton) {
        
    }
    
    func btnAdd_Touch (sender: UIButton) {
        
    }
    
    func popVCtrl() {
        let viewTop = CustomerBaseVCtrl.vData.subviews[CustomerBaseVCtrl.vData.subviews.count - 1]
        
        UIView.animateWithDuration(0.3, animations: {
            viewTop.frame.origin.x = viewTop.frame.width
            viewTop.alpha = 0
            
            }, completion: {finished in
            viewTop.removeFromSuperview()
        })

    }
    
    func pushVCtrl(vCtrl: UIViewController) {
        vCtrl.view.frame.origin.x = CustomerBaseVCtrl.vData.width
        vCtrl.view.frame.size = CustomerBaseVCtrl.vData.size
        
        vCtrl.view.userInteractionEnabled = false
        
        UIView.animateWithDuration(0.3, animations: {
            vCtrl.view.frame.origin.x = 0
            }, completion: { finished in
                vCtrl.view.userInteractionEnabled = true
        })
    }
    
    
}

class CustomerBarItem {
    var id: String?
    var name: String?
    var viewController: CustomerBaseVCtrl!
}
