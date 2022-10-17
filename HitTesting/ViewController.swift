//
//  ViewController.swift
//  HitTesting
//
//  Created by Вячеслав Квашнин on 16.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .purple
        return view
    }()
    
    let view2: UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Testing"
        view.backgroundColor = .cyan
        
        setup()
        makeHole()
    }
    
    private func setup() {
        view.addSubview(view1)
        view1.addSubview(view2)
    }
    
    private func makeHole() {
        let path = UIBezierPath(rect: view1.bounds)
        
        let pathWithRadius = UIBezierPath(
              roundedRect: view2.frame,
              byRoundingCorners: [.allCorners],
              cornerRadii: view2.frame.size)
        
        path.append(pathWithRadius)
        
        let mask = CAShapeLayer()
           mask.path = path.cgPath
           mask.fillRule = CAShapeLayerFillRule.evenOdd

           view1.layer.mask = mask
    }
}

