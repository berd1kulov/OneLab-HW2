//
//  MyFriendsCell.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit
import SnapKit

class MyFriendsCell: UICollectionViewCell {
    private var viewModel = MyFriendsCellViewModel()
    
    var user: User? {
        didSet{
            userImage.image = UIImage(named: user?.imageName ?? "profile_1")
            nameLabel.text = user?.name
            speciality.text = user?.speciality
            isOnlineView.backgroundColor = viewModel.getIsOnlineColor(user?.isOnline ?? .offline)
        }
    }
    
    private var userImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    private var isOnlineView: UIView = {
        let customView = UIView()
        customView.layer.cornerRadius = 5
        customView.backgroundColor = .systemGreen
        customView.clipsToBounds = true
        return customView
    }()
    private var nameLabel = UILabel()
    private var speciality = UILabel()
    
    func styleViews() {
        nameLabel.text = "Alana Smith"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        speciality.text = "UI/UX Designer"
        speciality.numberOfLines = 0
        speciality.font = UIFont.systemFont(ofSize: 14)
        speciality.textColor = .lightGray
        
        self.layer.cornerRadius = 12.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
    
    
    func setupViews() {
        
        let stackView = UIStackView(arrangedSubviews: [
            userImage,
            nameLabel,
            speciality
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.layer.cornerRadius = 12
        stackView.clipsToBounds = true
        
        addSubview(stackView)
        
        //stackView layout
        stackView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        userImage.snp.makeConstraints{
            $0.size.equalTo(stackView.snp.width).multipliedBy(0.6)
        }
        addSubview(isOnlineView)
        isOnlineView.snp.makeConstraints{
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.right.equalTo(nameLabel.snp.left).offset(-4)
            $0.size.equalTo(10)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        styleViews()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.userImage.layer.cornerRadius = (self.bounds.width * 0.6) / 2.0
    }
}
