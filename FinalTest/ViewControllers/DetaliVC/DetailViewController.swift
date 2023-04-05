//
//  DetailViewController.swift
//  FinalTest
//
//  Created by imran on 05.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var prodName: String =  ""
    var prodImage: UIImageView?
    var prodPrice: String?
    var amount: Float = 1
    
    private let backButtonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.backward.square.fill")
        image.tintColor = .orange
        image.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 5
        return image
    }()
    
    private let favButtonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.square.fill")
        image.tintColor = .orange
        image.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 5
        return image
    }()
    
    private let pageName: UILabel = {
       let label = UILabel()
        label.text = "Detail"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let productName: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 38)
        label.text = "Name"
        label.numberOfLines = 2
        return label
    }()
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let text : UILabel = {
       let text = UILabel()
        text.text = "Choose the size"
        text.textColor = .black
        text.font = .boldSystemFont(ofSize: 22)
        return text
    }()
    
    private let size8inch : UIView = {
        let inch = UIView()
        inch.backgroundColor = .white
        inch.layer.cornerRadius = 10
        inch.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        inch.layer.shadowOpacity = 0.3
        inch.layer.shadowOffset = .zero
        inch.layer.shadowRadius = 5
        return inch
    }()
    
    private let size20inch : UIView = {
        let inch = UIView()
        inch.backgroundColor = .white
        inch.layer.cornerRadius = 10
        inch.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        inch.layer.shadowOpacity = 0.3
        inch.layer.shadowOffset = .zero
        inch.layer.shadowRadius = 5
        return inch
    }()
    
    private let size32inch : UIView = {
        let inch = UIView()
        inch.backgroundColor = .white
        inch.layer.cornerRadius = 10
        inch.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        inch.layer.shadowOpacity = 0.3
        inch.layer.shadowOffset = .zero
        inch.layer.shadowRadius = 5
        return inch
    }()
    
    private var size8inchText: UILabel = {
       let text = UILabel()
        text.text = "8 inch"
        text.textColor = .textGray
        text.font = .systemFont(ofSize: 18)
        return text
    }()
    
    private var size20inchText: UILabel = {
       let text = UILabel()
        text.text = "20 inch"
        text.textColor = .textGray
        text.font = .systemFont(ofSize: 18)
        return text
    }()
    
    private var size32inchText: UILabel = {
       let text = UILabel()
        text.text = "32 inch"
        text.textColor = .textGray
        text.font = .systemFont(ofSize: 18)
        return text
    }()
    
    private let amountView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9333333373, green: 0.9333333373, blue: 0.9333333373, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let plusTap: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = .darkGray
        return image
    }()
    
    private let minusTap: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "minus")
        image.tintColor = .darkGray
        return image
    }()
    
    private let amountText: UILabel = {
        let text = UILabel()
        text.text = ""
        text.textColor = .darkGray
        text.font = .boldSystemFont(ofSize: 28)
        return text
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.text = "Price"
        label.textColor = .textGray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private var priceText: UILabel = {
        let label = UILabel()
         label.font = . boldSystemFont(ofSize: 24)
         label.textColor = #colorLiteral(red: 0.187154144, green: 0.704031527, blue: 0, alpha: 1)
         return label
    }()

    private let addToCart: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 15
        return view
    }()

    private let addToCartText: UILabel = {
        let text = UILabel()
        text.textColor = .white
        text.text = "Add to Cart"
        text.font = .boldSystemFont(ofSize: 18)
        return text
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(backButtonImage)
        
        prodPrice!.remove(at: prodPrice!.index(prodName.startIndex, offsetBy: 0))
        productName.text = prodName
        productImage = prodImage!
        amountText.text = "\(Int(amount))"
        priceText.text = "$\(Float(prodPrice!)!)"
        
        
        backButtonImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(58)
            make.leading.equalToSuperview().offset(25)
            make.width.height.equalTo(45)
        }
        
        backButtonImage.isUserInteractionEnabled = true
        backButtonImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBack)))
        
        view.addSubview(favButtonImage)
        
        favButtonImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(58)
            make.trailing.equalToSuperview().offset(-25)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(pageName)
        
        pageName.snp.makeConstraints{make in
            make.centerY.equalTo(backButtonImage)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(productName)
        
        productName.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(146)
        }
        
        view.addSubview(productImage)
        
        productImage.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(productName).offset(120)
            make.height.width.equalTo(200)
        }
        
        view.addSubview(text)
        
        text.snp.makeConstraints{make in
            make.top.equalTo(productImage.snp.bottom).offset(43)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(size8inch)
        size8inch.addSubview(size8inchText)
        
        size8inch.snp.makeConstraints{make in
            make.height.equalTo(38)
            make.width.equalTo((size8inchText.text!.count+3)*10)
            make.leading.equalToSuperview().offset(26)
            make.top.equalTo(text.snp.bottom).offset(38)
        }
        
        size8inch.isUserInteractionEnabled = true
        size8inch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select8Size)))
        
        size8inchText.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        
        view.addSubview(size20inch)
        size20inch.addSubview(size20inchText)
        
        size20inch.snp.makeConstraints{make in
            make.height.equalTo(38)
            make.width.equalTo((size20inchText.text!.count+3)*10)
            make.centerX.equalToSuperview().offset(-5)
            make.top.equalTo(text.snp.bottom).offset(38)
        }
        
        size20inch.isUserInteractionEnabled = true
        size20inch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select20Size)))
        
        size20inchText.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(size32inch)
        size32inch.addSubview(size32inchText)
        
        size32inch.snp.makeConstraints{make in
            make.height.equalTo(38)
            make.width.equalTo((size32inchText.text!.count+3)*10)
            make.trailing.equalToSuperview().offset(-26)
            make.top.equalTo(text.snp.bottom).offset(38)
        }
        
        size32inch.isUserInteractionEnabled = true
        size32inch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select32Size)))
        
        size32inchText.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        view.addSubview(amountView)
        
        amountView.snp.makeConstraints{make in
            make.trailing.leading.equalToSuperview().inset(97)
            make.top.equalTo(size20inch.snp.bottom).offset(50)
            make.height.equalTo(65)
        }
        
        amountView.addSubview(plusTap)
        
        plusTap.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-38)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(22)
        }
        
        plusTap.isUserInteractionEnabled = true
        plusTap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(amontPlus)))
        
        amountView.addSubview(minusTap)
        
        minusTap.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(38)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(22)
        }
        
        minusTap.isUserInteractionEnabled = true
        minusTap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(amountMinus)))
        
        amountView.addSubview(amountText)
        
        amountText.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().offset(-70)
        }
        
        view.addSubview(priceText)
        
        priceText.snp.makeConstraints{make in
            make.top.equalTo(priceLabel.snp.bottom).offset(0)
            make.leading.equalToSuperview().offset(26)
        }
        
        view.addSubview(addToCart)
        
        addToCart.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-26)
            make.bottom.equalToSuperview().offset(-35)
            make.height.equalTo(54)
            make.width.equalTo(172)
        }
        
        addToCart.addSubview(addToCartText)
        
        addToCartText.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    @objc  func goBack(){
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .overFullScreen
        self.present(mainVC, animated: true)
    }
    
    @objc func select8Size(){
        if size8inch.backgroundColor != #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1) {
            size8inch.backgroundColor = #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1)
            size8inchText.textColor = .white
        }else{
            size8inch.backgroundColor = .white
            size8inchText.textColor = .textGray
        }

    }
    
    @objc func select20Size(){
        if size20inch.backgroundColor != #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1) {
            size20inch.backgroundColor = #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1)
            size20inchText.textColor = .white
        }else{
            size20inch.backgroundColor = .white
            size20inchText.textColor = .textGray
        }

    }
    
    @objc func select32Size(){
        if size32inch.backgroundColor != #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1) {
            size32inch.backgroundColor = #colorLiteral(red: 0.2627450824, green: 0.2627450824, blue: 0.2627450824, alpha: 1)
            size32inchText.textColor = .white
        }else{
            size32inch.backgroundColor = .white
            size32inchText.textColor = .textGray
        }
    }
    @objc func amontPlus(){
        amount+=1
        amountText.text = "\(Int(amount))"
        var a = Float(prodPrice!)!
        a = a*amount
        priceText.text = "$\(a)"
    }
    
    @objc func amountMinus(){
        amount-=1
        amountText.text = "\(Int(amount))"
        var a = Float(prodPrice!)!
        a = a*amount
        priceText.text = "$\(a)"
    }
}
