//
//  CustomCollectionViewCell.swift
//  CollectionViewCustom
//
//  Created by mahendran-14703 on 19/10/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(systemName: "house")
        myImage.contentMode = .scaleAspectFit
        return myImage
    }()
    
    private let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Custom"
        myLabel.textAlignment = .center
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.clipsToBounds = true
        [myImageView,myLabel].forEach { contentView.addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height - 50,
                               width: contentView.frame.size.width - 10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 5,
                                   y: 0,
                                   width: contentView.frame.size.width - 10,
                                   height: contentView.frame.size.height - 50)
    }
    
    func configure(label: String){
        myLabel.text = label
    }
}
