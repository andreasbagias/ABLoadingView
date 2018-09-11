//
//  ImageViewController.swift
//  ABLoadingView_Example
//
//  Created by Andreas Bagias on 11/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ABLoadingView

class ImageViewController: UIViewController {

    var index: Int = 0
    var gesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        if index == 0 {
            fakeLoadingCancelationWhenNoCancellationChoosenOnTapGesture()
        }else if index == 1 {
            LoadingView.shared.cancelationEnabled(true)
        }else if index == 2 {
            
            LoadingView.shared.cancelationEnabled(true)
            LoadingView.shared.percentageEnabled(true)
            
            simulateLoadingPercentageFakeTimer()
        }else if index == 3{
            LoadingView.shared.blurEnabled(false)
            fakeLoadingCancelationWhenNoCancellationChoosenOnTapGesture()
        }else if index == 4{
            LoadingView.shared.cancelationEnabled(true)
            LoadingView.shared.blurEnabled(false)
        }else if index == 5{
            LoadingView.shared.cancelationEnabled(true)
            LoadingView.shared.percentageEnabled(true)
            LoadingView.shared.blurEnabled(false)
            simulateLoadingPercentageFakeTimer()
        }
        
        LoadingView.shared.start()
    }
    
    //helper function to simulate loading percentage progress
    func simulateLoadingPercentageFakeTimer(){
        
        var percentage = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            
            LoadingView.shared.updatePercentage(percentage)
            
            if percentage == 100{
                timer.invalidate()
                LoadingView.shared.stop()
            }
            percentage += 5
        }
        
        timer.fire()
    }
    
    //helper function to simulate fake cancelation
    func fakeLoadingCancelationWhenNoCancellationChoosenOnTapGesture(){
        
        gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        (UIApplication.shared.delegate?.window!)!.addGestureRecognizer(gesture)
        
    }
    
    @objc func tapAction(){
        LoadingView.shared.stop()
        (UIApplication.shared.delegate?.window!)!.removeGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
