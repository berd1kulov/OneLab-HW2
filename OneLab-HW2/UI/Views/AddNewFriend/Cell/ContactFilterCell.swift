//
//  ContactFilterCell.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit

typealias ContactFilterCellConfigurator = TableCellConfigurator<ContactFilterCell, ContactFilter>
class ContactFilterCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = ContactFilter
    
    private let filterIcon: UIImageView = {
        let filterIcon = UIImageView()
        filterIcon.tintColor = .lightGray
        filterIcon.contentMode = .scaleAspectFit
        return filterIcon
    }()
    
    private let filterLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .systemBlue
        uiLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return uiLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [filterIcon, filterLabel])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    private func layoutUI() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        filterIcon.snp.makeConstraints {
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.size.equalTo(29)
        }
        
        filterLabel.snp.makeConstraints{
            $0.centerY.equalTo(stackView.snp.centerY)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: ContactFilter) {
        filterIcon.image = UIImage(systemName: data.iconName)
        filterLabel.text = data.filterByName
    }
}
