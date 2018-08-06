//
//  ViewController.swift
//  FHXBottomDelectVC
//
//  Created by fenghanxu on 08/06/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import FHXBottomDelectVC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.backgroundColor = UIColor.white
      
      let vc = RecipeCommentDeleteVC {
        print("添加需要处理的方法")
      }

      self.present(vc, animated: true, completion: nil)
      
      
      
    }



}

