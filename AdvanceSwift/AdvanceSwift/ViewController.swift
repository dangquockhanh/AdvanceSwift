//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum CarState {
        case expanded
        case collapsed
    }
    
    var cardViewController: CardViewController!
    var visualEffectView: UIVisualEffectView!
    
    let cardHeight:CGFloat = 600
    let cardHandleAreaHeight: CGFloat = 65
    
    var cardVisiable = false
    var nextState: CarState {
        return cardVisiable ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgessWhenInterupted: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCard()
    }

    func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        cardViewController.view.clipsToBounds = true
        
        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(handleCardTap))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(reconizer:)))
        
        cardViewController.handleAreaView.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleAreaView.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc func handleCardTap(reconizer: UIGestureRecognizer) {
        
    }
    
    @objc func handleCardPan(reconizer: UIPanGestureRecognizer) {
        switch reconizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let tranlation = reconizer.translation(in: self.cardViewController.handleAreaView)
            var fractionComplete = tranlation.y / cardHeight
            fractionComplete = cardVisiable ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionComplete: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }
    
    func startInteractiveTransition(state: CarState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeed(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgessWhenInterupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionComplete: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionComplete + animationProgessWhenInterupted
        }
    }
    
    func continueInteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
    func animateTransitionIfNeed(state: CarState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { (_) in
                self.cardVisiable = !self.cardVisiable
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 0
                }
            }
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .regular)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
        }
    }
}

