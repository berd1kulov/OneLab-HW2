//
//  MyFriendsCollectionViewController.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyFriendsCollectionViewController: UICollectionViewController {
    
    fileprivate let cellId = "cellId"
    
    private var viewModel = MyFriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        setupCollectionView()
        viewModel.fetchFrends()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(MyFriendsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    fileprivate func configureNavigationBar(){
        navigationItem.title = "My Friends".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addNewFriendTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchFriendTapped))
    }
    
}

// MARK: - CollectionView Actions
extension MyFriendsCollectionViewController {
    
    @objc private func addNewFriendTapped(){
        print("Add New Friend")
        let vc = AddNewFriendTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func searchFriendTapped(){
        print("Search Friend")
    }
}

// MARK: - CollectionView Delegate Methods
extension MyFriendsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 14) / 2
        return .init(width: width, height: width + 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// MARK: - CollectionView DataSource Methods
extension MyFriendsCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.frends.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyFriendsCell
        
        let user = viewModel.frends[indexPath.item]
        cell.user = user
        return cell
    }
}
