//
//  ViewController.swift
//  UIKitMaraphone6
//
//  Created by Анас Бен Мустафа on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    
    private var square: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBlue
        v.layer.cornerRadius = 12
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        square.center = view.center
        
        view.addSubview(square)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: view)
        let safeAreaInsets = view.safeAreaInsets
        let center = CGPoint(
            x: max(
                51,
                min(
                    location.x,
                    UIScreen.main.bounds.width - 51
                )
            ),
            y: max(
                safeAreaInsets.top + 50,
                min(
                    location.y,
                    UIScreen.main.bounds.height - 50 - safeAreaInsets.bottom
                )
            )
        )
        let behaviour = UISnapBehavior(
            item: square,
            snapTo: center
        )
        behaviour.damping = 0.5
        
        animator.removeAllBehaviors()
        animator.addBehavior(behaviour)
    }

}

