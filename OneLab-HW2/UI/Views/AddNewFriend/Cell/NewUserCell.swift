//
//  NewUserCell.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit

typealias NewUserCellConfigurator = TableCellConfigurator<NewUserCell, User>
class NewUserCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = User
    
    var viewModel = NewUserCellViewModel()
    
    private var added = true {
        didSet{
            if added{
                addButton.setTitle("ADD".localized(), for: .normal)
                addButton.setTitleColor(UIColor.systemBlue, for: .normal)
                addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
                addButton.setImageTintColor(.systemBlue)
                addButton.layer.borderColor = UIColor.systemBlue.cgColor
            }else{
                addButton.setTitle("ADDED".localized(), for: .normal)
                addButton.setTitleColor(UIColor.lightGray, for: .normal)
                addButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                addButton.setImageTintColor(.lightGray)
                addButton.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    private let userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 24
        userImage.clipsToBounds = true
        return userImage
    }()
    
    private let nameLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return uiLabel
    }()
    
    private let friendsLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .lightGray
        uiLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return uiLabel
    }()
    
    private var isOnlineView: UIView = {
        let customView = UIView()
        customView.layer.cornerRadius = 6
        customView.backgroundColor = .systemGreen
        customView.clipsToBounds = true
        return customView
    }()
    
    private var isOnlineWithBorder: UIView = {
        let customView = UIView()
        customView.layer.cornerRadius = 8
        customView.backgroundColor = .systemBackground
        customView.clipsToBounds = true
        return customView
    }()
    
    private let addButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("ADD".localized(), for: .normal)
        uiButton.setTitleColor(UIColor.systemBlue, for: .normal)
        uiButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        uiButton.layer.cornerRadius = 14
        uiButton.layer.borderWidth = 2
        uiButton.layer.borderColor = UIColor.systemBlue.cgColor
        uiButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 1, bottom: 2, right: 1)
        uiButton.titleEdgeInsets = UIEdgeInsets(top: 2, left: 1, bottom: 2, right: 1)
        return uiButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImage, vStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, friendsLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = true
        addButton.addTarget(self, action: #selector(didAddTapped), for: .touchUpInside)
        layoutUI()
    }
    
    private func layoutUI() {
        
        contentView.addSubview(stackView)
        isOnlineWithBorder.addSubview(isOnlineView)
        contentView.addSubview(isOnlineWithBorder)
        contentView.addSubview(addButton)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        userImage.snp.makeConstraints {
            $0.size.equalTo(48)
        }
        
        isOnlineWithBorder.snp.makeConstraints{
            $0.trailing.equalTo(userImage.snp.trailing)
            $0.bottom.equalTo(userImage.snp.bottom)
            $0.size.equalTo(16)
        }
        
        isOnlineView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(12)
        }
        
        addButton.snp.makeConstraints{
            $0.width.greaterThanOrEqualTo(71)
            $0.height.equalTo(28)
        }
        
        userImage.snp.makeConstraints{
            $0.centerY.equalTo(contentView.snp.centerY)
        }
        
        vStackView.snp.makeConstraints{
            $0.centerY.equalTo(contentView.snp.centerY)
        }
        
        addButton.snp.makeConstraints{
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.centerY.equalTo(contentView.snp.centerY)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }

    func configure(data: User) {
        userImage.image = UIImage(named: data.imageName)
        isOnlineView.backgroundColor = viewModel.getIsOnlineColor(data.isOnline)
        nameLabel.text = data.name
        friendsLabel.text = "\(data.friends.count) \("Friends".localized())"
    }
    
    @objc private func didAddTapped(){
        added.toggle()
    }
    
}
