//
//  ViewController.swift
//  AutoLayoutTutorial
//
//  Created by Johny Babylon on 12/18/20.
//  Copyright © 2020 Agile Associates. All rights reserved.
//

import UIKit

private let headerIdentifier = "ProfileHeader"
private let cellIdentifier = "ProfileCell"


class ProfileController: UICollectionViewController {
    
    // MARK: - Properties
    
    var images: [UIImage] = [#imageLiteral(resourceName: "larry_ellison_sailing-1"), #imageLiteral(resourceName: "steve_jobs"), #imageLiteral(resourceName: "Mark_Zuckerberg"), #imageLiteral(resourceName: "bezos"), #imageLiteral(resourceName: "sergey-brin-7"), #imageLiteral(resourceName: "larry_page"), #imageLiteral(resourceName: "bezos"), #imageLiteral(resourceName: "Jan-Koum"), #imageLiteral(resourceName: "the_woz"), #imageLiteral(resourceName: "marc_andressen"), #imageLiteral(resourceName: "steve_jobs"), #imageLiteral(resourceName: "larry_ellison_sailing-1"), #imageLiteral(resourceName: "marc_andressen"), #imageLiteral(resourceName: "Mark_Zuckerberg"), #imageLiteral(resourceName: "steve_jobs")]

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // register cell
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        // register header
        collectionView!.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
//        self.collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }


}

// MARK: - UICollectionViewDelegate/DataSource

extension ProfileController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeader
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        cell.image = images[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
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

