//
//  ViewController.swift
//  ParchmentTest
//
//  Created by Keishin CHOU on 2020/01/03.
//  Copyright © 2020 Keishin CHOU. All rights reserved.
//

import UIKit

import Parchment

struct IconItem: PagingItem, Hashable, Comparable {
    
    let icon: String
    let index: Int
    let image: UIImage?
    
    init(icon: String, index: Int) {
        self.icon = icon
        self.index = index
        self.image = UIImage(named: icon)
    }
    
    var hashValue: Int {
        return icon.hashValue
    }
        
    static func <(lhs: IconItem, rhs: IconItem) -> Bool {
        return lhs.index < rhs.index
    }
    
    static func ==(lhs: IconItem, rhs: IconItem) -> Bool {
        return (
            lhs.index == rhs.index &&
                lhs.icon == rhs.icon
        )
    }
}

class ViewController: UIViewController {
    
    fileprivate let icons = [
      "compass",
      "cloud",
      "bonnet",
      "axe",
      "earth",
      "knife",
      "leave",
      "light",
      "map",
      "moon",
      "mushroom",
      "shoes",
      "snow",
      "star",
      "star-1",
      "sun",
      "tipi",
      "tree",
      "water",
      "wind",
      "wood"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let pagingViewController = PagingViewController<PagingIndexItem>()
//        pagingViewController.dataSource = self
//        pagingViewController.delegate = self
        let pagingViewController = PagingViewController<IconItem>()
        pagingViewController.menuItemSource = .class(type: IconPagingCell.self)
        pagingViewController.menuItemSize = .fixed(width: 60, height: 60)
        pagingViewController.textColor = UIColor(red: 0.51, green: 0.54, blue: 0.56, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.14, green: 0.77, blue: 0.85, alpha: 1)
        pagingViewController.indicatorColor = UIColor(red: 0.14, green: 0.77, blue: 0.85, alpha: 1)
        pagingViewController.dataSource = self
        pagingViewController.select(pagingItem: IconItem(icon: icons[0], index: 0))
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        
    }
}

extension ViewController: PagingViewControllerDataSource {
    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int where T : PagingItem, T : Comparable, T : Hashable {
//        return cities.count
        return icons.count
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController where T : PagingItem, T : Comparable, T : Hashable {
//        return CityViewController(title: cities[index])
        return IconViewController(title: icons[index].capitalized)
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T where T : PagingItem, T : Comparable, T : Hashable {
//        return PagingIndexItem(index: index, title: cities[index]) as! T
        return IconItem(icon: icons[index], index: index) as! T
    }
}

//extension ViewController: PagingViewControllerDelegate {
//    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, widthForPagingItem pagingItem: T, isSelected: Bool) -> CGFloat? where T : PagingItem, T : Comparable, T : Hashable {
//
//        guard let item = pagingItem as? PagingIndexItem else { return 0 }
//
//        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: pagingViewController.menuItemSize.height)
//        let attributes = [NSAttributedString.Key.font: pagingViewController.font]
//
//        let rect = item.title.boundingRect(with: size,
//          options: .usesLineFragmentOrigin,
//          attributes: attributes,
//          context: nil)
//
//        let width = ceil(rect.width) + insets.left + insets.right
//
//        if isSelected {
//          return width * 1.5
//        } else {
//          return width
//        }
//    }
//}

