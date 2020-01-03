//
//  ViewController.swift
//  ParchmentTest
//
//  Created by Keishin CHOU on 2020/01/03.
//  Copyright © 2020 Keishin CHOU. All rights reserved.
//

import UIKit

import Parchment

class ViewController: UIViewController {
    
    fileprivate let cities = [
      "Oslo",
      "Stockholm",
      "Tokyo",
      "Barcelona",
      "Vancouver",
      "Berlin",
      "Shanghai",
      "London",
      "Paris",
      "Chicago",
      "Madrid",
      "Munich",
      "Toronto",
      "Sydney",
      "Melbourne"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pagingViewController = PagingViewController<PagingIndexItem>()
        pagingViewController.dataSource = self
        pagingViewController.delegate = self
        
//        let view1 = ViewControllerOne(index: 1)
//        let view2 = ViewControllerOne(index: 2)
//        let view3 = ViewControllerOne(index: 3)
//        let view4 = ViewControllerOne(index: 2)
//        let view5 = ViewControllerOne(index: 3)
//
//        let pagingViewController = FixedPagingViewController(viewControllers: [
//          view1,
//          view2,
//          view3,
//          view4,
//          view5,
//        ])
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
//        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//          pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//          pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//          pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//          pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
        
    }


}

extension ViewController: PagingViewControllerDataSource {
    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int where T : PagingItem, T : Comparable, T : Hashable {
        return cities.count
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController where T : PagingItem, T : Comparable, T : Hashable {
        return CityViewController(title: cities[index])
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T where T : PagingItem, T : Comparable, T : Hashable {
        return PagingIndexItem(index: index, title: cities[index]) as! T
    }
    
    
}

extension ViewController: PagingViewControllerDelegate {
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, widthForPagingItem pagingItem: T, isSelected: Bool) -> CGFloat? where T : PagingItem, T : Comparable, T : Hashable {
        
        guard let item = pagingItem as? PagingIndexItem else { return 0 }
        
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: pagingViewController.menuItemSize.height)
        let attributes = [NSAttributedString.Key.font: pagingViewController.font]
        
        let rect = item.title.boundingRect(with: size,
          options: .usesLineFragmentOrigin,
          attributes: attributes,
          context: nil)

        let width = ceil(rect.width) + insets.left + insets.right
        
        if isSelected {
          return width * 1.5
        } else {
          return width
        }
    }
}

