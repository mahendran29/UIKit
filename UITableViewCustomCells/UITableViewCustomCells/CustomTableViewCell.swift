//
//  CustomTableViewCell.swift
//  UITableViewCustomCells
//
//  Created by mahendran-14703 on 18/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private var _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private var myLabel: UILabel = {
       let myLabel = UILabel()
        myLabel.textColor = .white
        myLabel.font = .systemFont(ofSize: 17, weight: .bold)
        myLabel.text = "Custom Cell 1"
       return myLabel
    }()
    
    private var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Linkin-Park")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
       return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .green
        contentView.addSubview(_switch)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(text: String,imgaeName: String) {
        myLabel.text = text
        myImageView.image = UIImage(named: imgaeName)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        myLabel = nil
//        myImageView = nil
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     //   print("C: \(contentView.frame.size)")
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
     //   print(contentView.frame.size.height)
        let imageSize = contentView.frame.size.height - 6
        
        _switch.frame = CGRect(
                            x: 5,
                            y: (contentView.frame.size.height - switchSize.height) / 2,
                            width: switchSize.width,
                            height: switchSize.height)
        
        myLabel.frame = CGRect(x: _switch.frame.size.width + 10,
                               y: 0,
                               width: contentView.frame.size.width - 10 - _switch.frame.size.width - imageSize,
                               height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: contentView.frame.size.width - imageSize - 10,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
}
