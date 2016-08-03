//
//  CustomerGroupVCtrl.swift
//  BasicApp_Customer
//
//  Created by quoclki on 8/2/16.
//  Copyright © 2016 quoclki. All rights reserved.
//

import UIKit

class CustomerGroupVCtrl: CustomerBaseVCtrl {

    // MARK: - Outlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var clvGroup: UICollectionView!
    
    // MARK: - Private properties

    // MARK: - Properties
    
    // MARK: - Init
    
    // MARK: - UIViewController func
    
    // MARK: - Func
    override func loadData() {
        super.loadData()
    }
    
    // MARK: - Layout UI
    override func configUI() {
        super.configUI()
        searchBar.delegate = self
    }
    
    override func configUIViewWillAppear() {
        super.configUIViewWillAppear()
        
    }
    
    // MARK: - Event Listerner
    override func eventListener() {
        super.eventListener()
        
    }
    
    // MARK: - Event Handler

}

extension CustomerGroupVCtrl: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}

