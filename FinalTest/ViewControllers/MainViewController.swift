//
//  MainViewController.swift
//  FinalTest
//
//  Created by imran on 01.04.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    private var categories: [String] = [" All ", "Pizza", "Fast Food", "Vegan"]
    private var menuList: [Menu] = []
    private var filteredMenu: [Menu] = []
    private var isFiltering: Bool = false
    
    private let helloLabel: UILabel = {
       let helloLabel = UILabel()
        helloLabel.text = "Hello Imran"
        helloLabel.font = .systemFont(ofSize: 18)
        helloLabel.textColor = .textGray
        return helloLabel
    }()
    
    private let welcomeBack: UILabel = {
      let welcomeBack = UILabel()
        welcomeBack.text = "Welcome Back !"
        welcomeBack.font = .systemFont(ofSize: 32)
        return welcomeBack
    }()

    private let bellImage: UIImageView = {
        let bellImage = UIImageView()
        bellImage.image = UIImage(systemName: "bell.badge")
        bellImage.tintColor = .darkGray
        bellImage.clipsToBounds = true
        return bellImage
    }()
    
    private let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1.0
        searchBar.clipsToBounds = true
        searchBar.placeholder = "Search..."
        return searchBar
    }()
    
    private let filterButton: UIButton = {
       let filterButton = UIButton()
        filterButton.backgroundColor = .orange
        filterButton.layer.cornerRadius = 10
        return filterButton
    }()
    
    private let filterImage: UIImageView = {
       let filterImage = UIImageView()
        filterImage.image = UIImage(named: "filter")
        return filterImage
    }()
    
    var categoryCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 24)
        layout.minimumInteritemSpacing = 25
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(СategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(helloLabel)
        view.addSubview(welcomeBack)
        view.addSubview(bellImage)
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        filterButton.addSubview(filterImage)
        view.addSubview(categoryCollectionView)
        view.addSubview(menuTableView)
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        searchBar.delegate = self
        
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cell")
        
        helloLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(58)
            make.leading.equalToSuperview().offset(24)
        }
        
        welcomeBack.snp.makeConstraints{make in
            make.top.equalTo(helloLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(24)
        }
        
        bellImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(58)
            make.trailing.equalToSuperview().offset(-31)
            make.height.equalTo(32)
            make.width.equalTo(30)
        }
        
        searchBar.snp.makeConstraints{make in
            make.top.equalTo(welcomeBack.snp.bottom).offset(36)
            make.trailing.equalToSuperview().offset(-74)
            make.height.equalTo(55)
            make.width.equalTo(302)
        }
        
        filterButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(168)
            make.trailing.equalToSuperview().offset(-24)
            make.height.width.equalTo(36)
        }
        
        filterImage.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(16)
        }
        
        categoryCollectionView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.height.equalTo(60)
        }
        
        menuTableView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(38)
            make.bottom.equalToSuperview().offset(0)
        }
        
        initData()
        
    }
    
    private func initData(){
        menuList = [Menu(name: "Pizza with \nMushrooms",
                         image: "Mushrooms",
                         category: " All Pizza",
                         time: "14-20",
                         price: 12,
                         fav: false,
                         menu: "All"),
                    Menu(name: "Pepperoni \nCheese Pizza",
                        image: "Pepperoni",
                        category: " All Pizza",
                        time: "18-25",
                        price: 14,
                        fav: false,
                        menu: "All"),
                    Menu(name: "Margarita \nItalian Pizza",
                        image: "Margarita",
                        category: " All Pizza",
                        time: "20-30",
                        price: 20,
                        fav: false,
                        menu: "All"),
                    Menu(name: "Burger",
                        image: "Burger",
                        category: " All Fast Food",
                        time: "8-12",
                        price: 8,
                        fav: false,
                        menu: "All"),
                    Menu(name: "Hot-Dog",
                        image: "HotDog",
                        category: " All Fast Food",
                        time: "5-10",
                        price: 5,
                        fav: false,
                        menu: "All"),
                    Menu(name: "Greek Salad",
                        image: "Salad",
                        category: " All Vegan",
                        time: "10-15",
                        price: 12,
                        fav: false,
                        menu: "All")
        ]
    }
    
    var cVItemWidth :CGFloat = 0
    var selectedCell : [Int] = []
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! СategoryCollectionViewCell
        cell.label.text = categories[indexPath.row]
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cVItemWidth = CGFloat(categories[indexPath.row].count)
        return CGSize(width: (cVItemWidth+3)*10 , height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.visibleCells as! [СategoryCollectionViewCell]
        for i in cell{
            i.contentView.backgroundColor = .white
            i.label.textColor = .textGray
            i.label.font = .systemFont(ofSize: 18)
        }
        let selectCell = collectionView.cellForItem(at: indexPath) as! СategoryCollectionViewCell
        selectCell.contentView.backgroundColor = #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1)
        selectCell.label.textColor = .white
        selectCell.label.font = .boldSystemFont(ofSize: 18)
        let searchCell = searchBar
        searchCell.searchTextField.text = selectCell.label.text
        filteredMenu =  menuList.filter({$0.category.lowercased().contains((searchCell.searchTextField.text?.lowercased())!)})
        menuTableView.reloadData()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        isFiltering ? filteredMenu.count : menuList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        cell.setData(name: isFiltering ?
                     filteredMenu[indexPath.row].name : menuList[indexPath.row].name,
                     imageName: isFiltering ?
                     filteredMenu[indexPath.row].image : menuList[indexPath.row].image,
                     time: isFiltering ?
                     filteredMenu[indexPath.row].time : menuList[indexPath.row].time,
                     price: isFiltering ?
                     filteredMenu[indexPath.row].price : menuList[indexPath.row].price)
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        print("tapped")
        let vc = DetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.prodName = selectCell.nameLabel.text!
        vc.prodImage = selectCell.image
        vc.prodPrice = selectCell.priceLabel.text
        self.present(vc, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isFiltering = false
        }else{
            isFiltering = true
            filteredMenu = menuList.filter({$0.name.lowercased().contains(searchText.lowercased()) || $0.category.lowercased().contains(searchText.lowercased())})
        }
        
        menuTableView.reloadData()
    }
}
