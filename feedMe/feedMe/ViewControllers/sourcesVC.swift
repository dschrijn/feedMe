//
//  sourcesVC.swift
//  secondFeedrReader
//
//  Created by David A. Schrijn on 3/22/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

// MARK: - Global Variable

let kSourceKey = "globalSourceKey"

class sourcesVC: UIViewController {
    
    // MARK: - Variables
    
    weak var delegate: FilterDelegate?
    
    
    // MARK: - App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func newAPIBtn(_ sender: Any) {
        if let url = NSURL(string: "https://newsapi.org/") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    
    }
    
    @IBAction func abcBtn(_ sender: Any) {
        let apiManager = APIManager()
        UserDefaults.standard.set("abc-news-au", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
        //No latest feature
    }
    @IBAction func engadgetBtn(_ sender: UIButton) {
        let apiManager = APIManager()
        UserDefaults.standard.set("engadget", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func ewBtn(_ sender: Any) {
        
        let apiManager = APIManager()
        UserDefaults.standard.set("entertainment-weekly", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
        //No latest feature
    }
    @IBAction func ignBtn(_ sender: Any) {
        let apiManager = APIManager()
        UserDefaults.standard.set("ign", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func vergeBtn(_ sender: Any) {
        let apiManager = APIManager()
        UserDefaults.standard.set("the-verge", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func usaBtn(_ sender: Any) {
        let apiManager = APIManager()
        UserDefaults.standard.set("the-new-york-times", forKey: kSourceKey)
        let source = UserDefaults.standard.string(forKey: kSourceKey)
        apiManager.parsedData(sort: "top", source: source!) { (news) in
            self.delegate?.newsUpdate(news)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
