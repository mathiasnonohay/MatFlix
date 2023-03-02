//
//  UpcomingViewController.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 02/08/22.
//

import UIKit

class UpcomingViewController: UIViewController {

    private var shows: [Show] = [Show]()
    
    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        table.register(ShowTableViewCell.self, forCellReuseIdentifier: ShowTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        title = "Upcoming"
        
        setNavBar()
        fetchUpcoming()
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
     
    private func fetchUpcoming() {
        APICaller.shared.getShows(with: .movie, and: .upcoming) { [weak self] result in
            switch result {
            case .success(let shows):
                self?.shows = shows
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.identifier, for: indexPath) as? ShowTableViewCell else  { return UITableViewCell() }
        
        cell.configure(with: ShowViewModel(title: shows[indexPath.row].title ?? String.emptyString, posterURL: shows[indexPath.row].posterPath ?? String.emptyString))
    }
    
    
}
