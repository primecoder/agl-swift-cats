//
//  CatsByOwnerGendersViewController.swift
//  SwiftCats
//
//  Created by random on 24/4/21.
//

import UIKit

class CatsByOwnerGendersViewController: UIViewController {
    
    let viewModel: CatsByOwnerGendersViewModel
    
    let tableView = UITableView()
    
    init(viewModel: CatsByOwnerGendersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        // Register view cell & setup datasource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCatViewCell")
        tableView.dataSource = self
    }
}

extension CatsByOwnerGendersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.ownerGenders.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section < viewModel.ownerGenders.count else { return ("???") }
        return viewModel.ownerGenders[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < viewModel.ownerGenders.count else { return 0 }
        let gender = viewModel.ownerGenders[section]
        return viewModel.ownerGendersAndCats[gender]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCatViewCell", for: indexPath)
        configure(cell: cell, at: indexPath)
        return cell
    }
    
    private func configure(cell: UITableViewCell, at indexPath: IndexPath) {
        guard indexPath.section < viewModel.ownerGenders.count else {
            cell.textLabel?.text = "(invalid section)"
            return
        }
        let gender = viewModel.ownerGenders[indexPath.section]
        guard
            let cats = viewModel.ownerGendersAndCats[gender],
            indexPath.row < cats.count
        else {
            cell.textLabel?.text = "(invalid row)"
            return
        }
        let catName = cats[indexPath.row].name
        print("DEBUG > model: \(viewModel.ownerGendersAndCats)")
        print("DEBUG > gender: \(gender)")
        print("DEBUG > cats: \(cats)")
        print("DEBUG > cat name: \(catName)")
        cell.textLabel?.text = cats[indexPath.row].name
    }
}
