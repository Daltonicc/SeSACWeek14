//
//  PersonViewController.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/28.
//

import Foundation
import UIKit
import SnapKit

class PersonViewController: UIViewController {
    
    private var viewModel = PersonViewModel()
    
    fileprivate var tableView = UITableView()
    fileprivate var searchBar = UISearchBar()
    
    var list: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchBar.delegate = self
        
        viewModel.person.bind { person in
            self.list = person
            self.tableView.reloadData()
        }
    }
}

extension PersonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.fetchPerson(query: searchBar.text!, page: 1)
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
//        cell.textLabel?.text = list?.results[indexPath.row].name
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = "\(data.name) | \(data.knownForDepartment)"
        return cell
    }
}
