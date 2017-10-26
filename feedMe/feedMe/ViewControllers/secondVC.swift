//
//  secondVC.swift
//  secondFeedrReader
//
//  Created by David A. Schrijn on 3/21/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

class secondVC: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var dataScrollView: UIScrollView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var toStoryButton: UIButton!
    @IBOutlet weak var toSafariButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowBlurView: UIView!
    
    // MARK: - Variables
    
    var articlesInfo: FeedrInfo!
    
    
    // MARK: - App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffect()
        
        authorLabel.text = articlesInfo.arthor
        backgroundImageView.image = articlesInfo.image
        imageView.image = articlesInfo.image
        titleLabel.text = articlesInfo.title
        descriptionLabel.text = articlesInfo.description
        
    }
    
    override func viewWillLayoutSubviews() {
        dataScrollView.contentSize = CGSize(width: dataScrollView.contentSize.width, height: dataScrollView.contentSize.height)
        dataScrollView.delaysContentTouches = true
        dataScrollView.canCancelContentTouches = true
        
        imageView.layer.cornerRadius = 7.0
        imageView.clipsToBounds = true
        
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowOpacity = 0.80
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 10).cgPath
        shadowView.addSubview(imageView)
        
        shadowBlurView.clipsToBounds = false
        shadowBlurView.layer.shadowColor = UIColor.black.cgColor
        shadowBlurView.layer.shadowOffset = CGSize(width: 2, height: 1)
        shadowBlurView.layer.shadowOpacity = 0.60
        shadowBlurView.layer.shadowRadius = 5
        shadowBlurView.layer.shadowPath = UIBezierPath(roundedRect: shadowBlurView.bounds, cornerRadius: 5).cgPath
        shadowBlurView.addSubview(blurImageView)
        
        toStoryButton.layer.cornerRadius = 4.0
        toSafariButton.layer.cornerRadius = 4.0
        
    }

    
    // MARK: - Functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebVC {
            if let theArticle = sender as? FeedrInfo {
                destination.articlesInfo = theArticle
            }
        }
    }
    
    func blurEffect() {
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular)) as UIVisualEffectView
        visualEffectView.frame = blurImageView.bounds
        blurImageView.addSubview(visualEffectView)
        blurImageView.alpha = 1
        blurImageView.isUserInteractionEnabled = true
        blurImageView.layer.cornerRadius = 4.0
        blurImageView.clipsToBounds = true
    }
    
    
    // MARK: - IBActions
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func toStoryInApp(_ sender: Any) {
        performSegue(withIdentifier: "toWebView", sender: articlesInfo)
    }
    
    @IBAction func toStoryOutsideApp(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "You will be redirected to the website in Safari.", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            if let url = URL(string: self.articlesInfo.pageUrl) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }

}
