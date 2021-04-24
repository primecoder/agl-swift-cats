//
//  CatsByOwnerGendersViewController.swift
//  SwiftCats
//
//  Created by random on 24/4/21.
//

import UIKit

class CatsByOwnerGendersViewController: UIViewController {
    
    let viewModel: CatsByOwnerGendersViewModel
    
    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
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
        self.view.backgroundColor = .secondarySystemBackground
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .secondarySystemBackground

        // We will do the layout work ourselves.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Bind table view to the four sides of parent.
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Register view cell & setup datasource & delegate
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCatViewCell")
        tableView.dataSource = self
        tableView.delegate = self
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
        cell.textLabel?.text = cats[indexPath.row].name
    }
    
    /// Return string appropriate for section header of a table.
    private func formatSectionName(_ name: String) -> String {
        let firstCapStr =  (name.prefix(1).capitalized + name.dropFirst())
        return "Cats owned by: \(firstCapStr)"
    }
}

// MARK: - Table View DataSource -

extension CatsByOwnerGendersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.ownerGenders.count
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
    
}

// MARK: - Table View Delegate (Look-n-Feel) -

extension CatsByOwnerGendersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section < viewModel.ownerGenders.count else { return UILabel() }
        let sectionName = formatSectionName(viewModel.ownerGenders[section])
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = sectionName
        return label
    }
}
