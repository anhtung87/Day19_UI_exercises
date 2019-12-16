//
//  ViewController.swift
//  Day19_UI_exercises
//
//  Created by Hoang Tung on 12/16/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let topScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        view.backgroundColor = .systemIndigo
        view.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height / 2)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let purpleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: 50)
        let hypo: CGFloat = CGFloat(sqrtf(powf(Float(UIScreen.main.bounds.height / 2), 2) + powf(Float(UIScreen.main.bounds.width / 2), 2)))
        let path = UIBezierPath(
            arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: -UIScreen.main.bounds.height / 2),
            radius: hypo,
            startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        let subLayer = CAShapeLayer()
        subLayer.path = path.cgPath
        subLayer.fillColor = UIColor.systemIndigo.cgColor
        view.layer.addSublayer(subLayer)
//        view.layer.mask = subLayer
        view.layer.masksToBounds = true
        return view
    }()

    let page1View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: "page1Icon"))
        view.addSubview(image)
        image.center = view.center
        return view
    }()
    
    let page2View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: "page2Icon"))
        image.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 4 - 100, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
        view.addSubview(image)
        return view
    }()
    
    let page3View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: UIScreen.main.bounds.width * 2, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        let image = UIImageView(image: UIImage(named: "page3Icon"))
        image.frame = CGRect(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 4 - 100, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
        view.addSubview(image)
        return view
    }()
    
    let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
//        page.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        page.center.x = UIScreen.main.bounds.maxX / 2
        page.currentPageIndicatorTintColor = .systemIndigo
        page.pageIndicatorTintColor = .lightGray
        page.numberOfPages = 3
        page.currentPage = 0
        return page
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By tapping Log In, you agree with our Terms of Service and Privacy Policy"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemIndigo
        button.setTitle("LOG IN WITH FACEBOOK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We don't post anything to Facebook"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(topScrollView)
        topScrollView.addSubview(page1View)
        topScrollView.addSubview(page2View)
        topScrollView.addSubview(page3View)
        view.addSubview(purpleView)
        view.addSubview(pageControl)
        view.addSubview(label)
        view.addSubview(loginButton)
        view.addSubview(bottomLabel)
        
        topScrollView.delegate = self
        
        setupLayout()
        loginButton.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
    }

    func setupLayout() {
        topScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topScrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 + 50).isActive = true
        
        purpleView.topAnchor.constraint(equalTo: topScrollView.bottomAnchor, constant: 0).isActive = true
        purpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        purpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pageControl.topAnchor.constraint(equalTo: purpleView.topAnchor, constant: 50).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 32).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        bottomLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Xác định toạ độ khung nhìn của scrollView để thay đổi số trang hiện tại của pageControl
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    @objc func goToDetail() {
        let detailVC = DetailViewController()
        let navigation = UINavigationController(rootViewController: detailVC)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    
}

