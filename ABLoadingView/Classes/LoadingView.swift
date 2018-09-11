//
//  LoadingView.swift
//  ABLoadingView
//
//  Created by Andreas Bagias on 11/09/2018.
//

import Foundation
import UIKit

public class LoadingView: UIView{
    
    var loadingIndicatorView: UIActivityIndicatorView!
    var blurView: UIView!
    var effectView: UIVisualEffectView!
    var percentageLabel: UILabel!
    var cancelButton: UIButton!
    var whiteView: UIView!
    
    var state: State = State.notLoading
    
    enum State {
        case loading
        case notLoading
    }
    
    public static let shared: LoadingView = {
        let instance = LoadingView()
        
        return instance
    }()
    
    public func start(){
        if state == State.loading { return }
        state = State.loading
        let window: UIWindow = (UIApplication.shared.delegate?.window!)!
        window.addSubview(self)
    }
    
    public func stop(){
        state = State.notLoading
        resetUI()
        self.removeFromSuperview()
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        blurView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        blurView.alpha = 0.6
        blurView.backgroundColor = UIColor.white
        
        self.addSubview(self.blurView)
        
        whiteView = UIView(frame: CGRect(x: self.frame.size.width/2-60, y: self.frame.size.height/2-60, width: 120, height: 120))
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = 10
        whiteView.isHidden = false
        addSubview(whiteView)
        
        loadingIndicatorView = UIActivityIndicatorView(frame: CGRect(x: self.frame.size.width/2-20, y: self.frame.size.height/2-20, width: 40, height: 40))
        loadingIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        loadingIndicatorView.color = UIColor.black
        loadingIndicatorView.startAnimating()
        addSubview(loadingIndicatorView)
        
        percentageLabel = UILabel(frame: CGRect(x: self.frame.size.width/2-50, y: self.frame.size.height/2-20-40, width: 100, height: 40))
        percentageLabel.textColor = UIColor.black
        percentageLabel.textAlignment = NSTextAlignment.center
        percentageLabel.isHidden = true
        addSubview(percentageLabel)
        
        cancelButton = UIButton(frame: CGRect(x: self.frame.size.width/2-50, y: self.frame.size.height/2+20, width: 100, height: 30))
        cancelButton.addTarget(self, action: #selector(cancelAction), for: UIControlEvents.touchUpInside)
        cancelButton.setTitle("Cancel", for: UIControlState.normal)
        cancelButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        cancelButton.isHidden = true
        addSubview(cancelButton)
        
    }
    
    func resetUI(){
        cancelButton.isHidden = true
        percentageLabel.isHidden = true
        blurView.alpha = 0.6
    }
    
    public func cancelationEnabled(_ active: Bool){
        cancelButton.isHidden = !active
    }
    
    public func percentageEnabled(_ active: Bool){
        percentageLabel.isHidden = !active
    }
    
    public func updatePercentage(_ percentage: Int){
        percentageLabel.text = "\(percentage)%"
    }
    
    public func blurEnabled(_ enabled: Bool){
        blurView.alpha = enabled == true ? 0.6 : 0
    }
    
    @objc func cancelAction(){
        stop()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
