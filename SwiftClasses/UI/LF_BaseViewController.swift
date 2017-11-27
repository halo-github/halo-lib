//
//  LF_BaseViewController.swift
//  LFXeenhoTest
//
//  Created by 刘峰 on 2017/11/27.
//  Copyright © 2017年 halovv. All rights reserved.
//

import Foundation
import UIKit
class LF_BaseViewController: UIViewController,UIGestureRecognizerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取手势delegate
        let target:Any =  self.navigationController?.interactivePopGestureRecognizer!.delegate! as Any
        //自定义侧滑手势，与获取的delegate关联，使用系统回调
        let panGest = UIPanGestureRecognizer.init(target: target, action: Selector(("handleNavigationTransition:")))
        panGest.delegate = self
        self.view.addGestureRecognizer(panGest)
        //确保系统回调可用
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    // 从导航控制器第二个VC开始启用
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if childViewControllers.count == 1 {
            return false
        }
        return true
    }
}



