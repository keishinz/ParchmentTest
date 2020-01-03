//
//  ViewControllerOne.swift
//  ParchmentTest
//
//  Created by Keishin CHOU on 2020/01/03.
//  Copyright © 2020 Keishin CHOU. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        title = "View 1"
//        view.backgroundColor = .blue
//    }

    init(index: Int) {
      super.init(nibName: nil, bundle: nil)
      title = "View \(index)"
      
      let label = UILabel(frame: .zero)
      label.font = UIFont.systemFont(ofSize: 70, weight: UIFont.Weight.thin)
      label.textColor = UIColor(red: 95/255, green: 102/255, blue: 108/255, alpha: 1)
      label.text = "\(index)"
      label.sizeToFit()
      
      view.addSubview(label)
      view.constrainCentered(label)
      view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
