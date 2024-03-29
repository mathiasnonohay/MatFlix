//
//  HomeViewController.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 02/08/22.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTV = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming", "Top Rated"]
    var headerView: HeaderView?
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.backgroundColor = .black
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(homeFeedTable)
        
        configureNavBar()
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        homeFeedTable.tableHeaderView = headerView 
    }
    
    private func configureHeader(model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else { return }
        headerView?.headerView.sd_setImage(with: url, completed: nil)
    }
    
    private func configureNavBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        let logo = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        let emptySpace = UIBarButtonItem(systemItem: .flexibleSpace)
        let person =  UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        let playRect = UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)

        navigationItem.leftBarButtonItems = [logo, emptySpace]
        navigationItem.rightBarButtonItems = [person, playRect]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrending(type: .movie) { result in
                switch result {
                case .success(let shows):
                    cell.configure(with: shows)
                    self.configureHeader(model: shows[0].posterPath ?? "")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break;
        case Sections.TrendingTV.rawValue:
            APICaller.shared.getTrending(type: .tv) { result in
                switch result {
                case .success(let shows):
                    cell.configure(with: shows)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break;
        case Sections.Popular.rawValue:
            APICaller.shared.getShows(with: .movie, and: .popular) { result in
                switch result {
                case .success(let shows):
                    cell.configure(with: shows)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break;
        case Sections.Upcoming.rawValue:
            APICaller.shared.getShows(with: .movie, and: .upcoming) { result in
                switch result {
                case .success(let shows):
                    cell.configure(with: shows)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break;
        case Sections.TopRated.rawValue:
            APICaller.shared.getShows(with: .movie, and: .topRated) { result in
                switch result {
                case .success(let shows):
                    cell.configure(with: shows)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break;
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offSet = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSet))
    }
}
