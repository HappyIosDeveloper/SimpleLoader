//
//  SimpleLoaderView.swift
//  Traveli
//
//  Created by Alfredo Uzumaki on 12/16/1397 AP.
//  Copyright © 1397 AP GCo. All rights reserved.
//

import UIKit

let loader = UIActivityIndicatorView()

extension UIViewController {
    
    func setupLoader() {
        loader.frame = CGRect(origin: view.center, size: CGSize(width: 40, height: 40))
        loader.hidesWhenStopped = true
        loader.style = .whiteLarge
        loader.color = .blue
        if view.window != nil {
            view.window!.addSubview(loader)
        } else {
            view.addSubview(loader)
        }
        loader.center = view.center
    }
    
    func showLoader() {
        if loader.frame.width == 0 {
            setupLoader()
        } else {
            view.bringSubviewToFront(loader)
        }
        loader.layer.zPosition = 1
        loader.alpha = 0
        loader.startAnimating()
        loader.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        DispatchQueue.main.async {
            loader.center = self.view.center
        }
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            loader.alpha = 1
            loader.transform = CGAffineTransform(scaleX: 1, y: 1)
            loader.layer.zPosition = 1
        }, completion: nil)
    }
    
    func hideLoader() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            loader.alpha = 0
            loader.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }) { (finished) in
            loader.stopAnimating()
            loader.transform = .identity
            loader.frame.size.width = 0
            loader.removeFromSuperview()
        }
    }
}
