//
//  СategoryCollectionViewCell.swift
//  FinalTest
//
//  Created by imran on 03.04.2023.
//

import UIKit

class СategoryCollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 5
        
        
        contentView.layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale


        addSubview(label)
        label.textColor = .textGray
        label.font = .systemFont(ofSize: 18)
        label.text = "text"
        label.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
}

