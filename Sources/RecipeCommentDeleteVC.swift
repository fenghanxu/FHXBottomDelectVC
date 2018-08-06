//
//  RecipeCommentDelectedView.swift
//  B7iOSBuyer
//
//  Created by 冯汉栩 on 2018/5/24.
//  Copyright © 2018年 com.spzjs.b7iosbuy. All rights reserved.
//

import UIKit
import SnapKit

public class RecipeCommentDeleteVC: UIViewController {
  
   let delectedBtn = UIButton()
   let cancelBtn = UIButton()
   let closeBtn = UIControl()
    
//  var doneEvents: ()->()
    
//   var sendValues:(() -> Void)?
    var sendValues:(()->Void)?

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public init(doneEvent: @escaping ()->()) {
    super.init(nibName: nil, bundle: nil)
    self.transitioningDelegate = self
    self.modalTransitionStyle = .crossDissolve
    self.modalPresentationStyle = .overCurrentContext
//    delectedBtn.add(for: UIControlEvents.touchUpInside) {
//      doneEvent()
//      self.dismiss(animated: true, completion: nil)
//    }
//    doneEvent()
//    delectedBtn.addTarget(self, action: #selector(delectedBtnClick doneEvent: @escaping ()->()), for: .touchUpInside)
    self.sendValues = doneEvent
    delectedBtn.addTarget(self, action: #selector(delectedBtnClick), for: .touchUpInside)
    
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    buildUI()
  }
  
   func buildUI(){
    view.backgroundColor = UIColor.clear
    view.addSubview(closeBtn)
    view.addSubview(cancelBtn)
    view.addSubview(delectedBtn)
    buildSubview()
    buildLayout()
  }
  
   func buildSubview(){
    delectedBtn.setTitle("删除", for: .normal)
    delectedBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    delectedBtn.setTitleColor(UIColor.red, for: .normal)
    delectedBtn.backgroundColor = UIColor.white
    delectedBtn.layer.cornerRadius = 2
    delectedBtn.layer.masksToBounds = true
    delectedBtn.addTarget(self, action: #selector(dismissClick), for: .touchUpInside)
    
    cancelBtn.setTitle("取消", for: .normal)
    cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    cancelBtn.setTitleColor(UIColor.black, for: .normal)
    cancelBtn.backgroundColor = UIColor.white
    cancelBtn.layer.cornerRadius = 2
    cancelBtn.layer.masksToBounds = true
    cancelBtn.addTarget(self, action: #selector(dismissClick), for: .touchUpInside)
    
  }
  
   func buildLayout(){
    cancelBtn.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(15)
      make.bottom.right.equalToSuperview().offset(-15)
      make.height.equalTo(50)
    }
    
    delectedBtn.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(15)
      make.right.equalToSuperview().offset(-15)
      make.bottom.equalTo(cancelBtn.snp.top).offset(-10)
      make.height.equalTo(50)
    }
    
    closeBtn.snp.makeConstraints { (make) in
      make.top.bottom.right.left.equalToSuperview()
    }
  }

  @objc func delectedBtnClick(){
      sendValues?()
      self.dismiss(animated: true, completion: nil)
  }
  
  @objc func dismissClick(){
    self.dismiss(animated: true, completion: nil)
  }

}

extension RecipeCommentDeleteVC: UIViewControllerTransitioningDelegate{
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentTransitioning()
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentTransitioning()
  }
  
}

