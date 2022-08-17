//
//  UITableVIew+Ext.swift
//  GHBFollowers
//
//  Created by Asyl Yerzhanuly on 17.08.2022.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
