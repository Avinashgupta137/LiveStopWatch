//
//  ViewController.swift
//  LiveActivitySwift
//
//  Created by Appsquadz on 29/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//MARK: - Button Action
    
    @IBAction func btnCreateLive(_ sender: UIButton) {
        Task {
            try await Task.sleep(nanoseconds:2_000_000_000)
            LiveActivityManager.shared.createLiveActivityRequest()
        }
        
    }
    
    @IBAction func btnUpdateLive(_ sender: UIButton) {
        Task {
            try await Task.sleep(nanoseconds:2_000_000_000)
            await LiveActivityManager.shared.updateLiveActivity(to: LiveActivityManager.shared.isLiveActivityUpdateOnce ? .tripOntheway : .abouttoickup)
        }
    }
    
    @IBAction func btnEndLive(_ sender: UIButton) {
        Task {
            await LiveActivityManager.shared.endLiveActivity()
        }
    }
    
    @IBAction func btnAutoUpdateLive(_ sender: UIButton) {
        
    }
    
}

