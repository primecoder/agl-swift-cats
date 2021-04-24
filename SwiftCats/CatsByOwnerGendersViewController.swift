//
//  CatsByOwnerGendersViewController.swift
//  SwiftCats
//
//  Created by random on 24/4/21.
//

import UIKit

class CatsByOwnerGendersViewController: UIViewController {
    
    let vm: CatsByOwnerGendersViewModel
    
    let tableView = UITableView()

    // Used when loading view from storyboard/interface builder.
    override func viewDidLoad() { super.viewDidLoad() }
    
    // Use this instead when adding view programmatically.
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        // We will do the layout work ourselves.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Bind table view to the four sides of parent.
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
