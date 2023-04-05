//
//  MenuTableViewCell.swift
//  FinalTest
//
//  Created by imran on 04.04.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 15
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let timeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "stopwatch")
        image.tintColor = .textGray
        return image
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .textGray
        return label
    }()
    
    var priceLabel: UILabel = {
       let label = UILabel()
        label.font = . boldSystemFont(ofSize: 24)
        label.textColor = #colorLiteral(red: 0.187154144, green: 0.704031527, blue: 0, alpha: 1)
        return label
    }()
    
    private let plusButtonImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "plus.square.fill")
        image.tintColor = .orange
        image.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 5
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(image)
        bgView.addSubview(timeImage)
        bgView.addSubview(timeLabel)
        bgView.addSubview(priceLabel)
        bgView.addSubview(plusButtonImage)
        
        bgView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview().inset(18)
            make.height.equalTo(184)
        }
        
        nameLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(190)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(68)
        }
        
        image.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-180)
        }
        
        timeImage.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(190)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.height.equalTo(18)
            make.width.equalTo(15)
        }
        
        timeLabel.snp.makeConstraints{ make in
            make.leading.equalTo(timeImage).offset(23)
            make.top.equalTo(nameLabel.snp.bottom).offset(17)
        }
        
        priceLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(190)
            make.top.equalTo(nameLabel.snp.bottom).offset(51)
        }
        
        plusButtonImage.snp.makeConstraints{make in
            make.height.width.equalTo(40)
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String, imageName: String, time: String, price: Float){
        nameLabel.text = name
        image.image = UIImage(named: imageName)
        timeLabel.text = "\(time) minutes"
        priceLabel.text = "$\(Int(price))"
    }
}
