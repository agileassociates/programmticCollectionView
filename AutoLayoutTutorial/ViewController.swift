//
//  ViewController.swift
//  AutoLayoutTutorial
//
//  Created by Johny Babylon on 12/18/20.
//  Copyright © 2020 Agile Associates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        
        view.addSubview(profileImageView)  // must declare view as lazy var - see above
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 88,  width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2    // makes it circle
        
        view.addSubview(messageButton)
        messageButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 44, paddingLeft: 32, width: 32, height: 32)
        view.addSubview(followButton)
        followButton.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 44, paddingRight: 32, width: 32, height: 32)
        
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "larry_ellison_sailing")                          // type in "image literal, then double-click on box"
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Screen Shot 2020-12-18 at 4.53.57 AM").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "add_follow_guy").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,  right: view.rightAnchor, height: 300)
        
        
        

        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }


}

extension UIColor {
    static func rgb(red: CGFloat, green:CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false  // Activates programatic constraints
        
        if let top = top {
                topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom{
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}

