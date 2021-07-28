//
//  DataCell.swift
//  SwiftDataTables
//
//  Created by Pavan Kataria on 22/02/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit
protocol DataCellButtonDelegate {
    func didClickedButton()
}
class DataCell: UICollectionViewCell {
    
    //MARK: - Properties
    private enum Properties {
        static let verticalMargin: CGFloat = 5
        static let horizontalMargin: CGFloat = 15
        static let widthConstant: CGFloat = 20
    }
    
    let dataLabel = UILabel()
    let dataButton = UIButton()
    var delegate : DataCellButtonDelegate?
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dataLabel)
        contentView.addSubview(dataButton)
        NSLayoutConstraint.activate([
            dataLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: Properties.widthConstant),
            dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Properties.verticalMargin),
            dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Properties.verticalMargin),
            dataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Properties.horizontalMargin),
            dataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Properties.horizontalMargin),
        ])
        
        NSLayoutConstraint.activate([
            dataButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Properties.widthConstant),
            dataButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Properties.verticalMargin),
            dataButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Properties.verticalMargin),
            dataButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            dataButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        dataButton.backgroundColor = .blue
        dataButton.tintColor = .white
        dataButton.addTarget(self, action: #selector(didClickedButton(_:)), for: .touchUpInside)
    }
    @objc func didClickedButton(_ sender : UIButton){
        delegate?.didClickedButton()
    }
    func configure(_ viewModel: DataCellViewModel,buttonTitle:String){
        if viewModel.data.stringRepresentation == "Button" {
            self.dataLabel.isHidden = true
            self.dataButton.isHidden = false
            self.dataButton.setTitle(buttonTitle, for: .normal)
            self.dataButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        }else{
            self.dataLabel.isHidden = false
            self.dataButton.isHidden = true
            self.dataLabel.text = viewModel.data.stringRepresentation
        }
    }
}
