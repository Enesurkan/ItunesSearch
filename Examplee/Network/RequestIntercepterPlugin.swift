//
//  RequestIntercepterPlugin.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Lottie
import Result
import SnapKit

final class RequestInterceptor: PluginType {
    
    var disposeBag = DisposeBag()
    let animationView = AnimationView()
    let animation = Animation.named("loading")
    let containerView = UIView()
    let appDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    func willSend(_ request: RequestType, target: TargetType) {
        
        #if DEBUG
        if let _data = request.request?.httpBody, let requestText = String(data:_data , encoding: .utf8) {
            print("Request -> \(requestText)")
        }
        #endif
        
        if addedProgress(target as! AppAPI){
            DispatchQueue.main.async {
                if let viewController = UIApplication.topViewController() {
                    self.createCustomActivityIndicator(view: viewController.view)
                }
            }
        }
    }
    
    func addedProgress(_ serviceType : AppAPI) -> Bool{
        switch serviceType {
        case .search:
            return true
        default:
            return false
        }
    }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
        if addedProgress(target as! AppAPI){
            DispatchQueue.main.async {
                if let viewController = UIApplication.topViewController() {
                    self.hideCustomActivityIndicator(view: viewController.view)
                }
            }
        }
    }
    
    private func createCustomActivityIndicator(view: UIView){
        let height = UIScreen.main.bounds.size.height
        let width = UIScreen.main.bounds.size.width
        containerView.frame = CGRect(x: 0 ,y: 0, width: width, height:height)
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        animationView.frame = CGRect(x: (width / 2) - (80 / 2),
                                     y: (height / 2) - (80 / 2), width: 80, height: 80)
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        containerView.addSubview(animationView)
        let window = UIApplication.shared.keyWindow!
        window.addSubview(containerView)
        containerView.snp.makeConstraints({ make in
            make.left.right.top.bottom.equalToSuperview()
        })
        animationView.play()
    }
    
    private func hideCustomActivityIndicator(view: UIView){
        animationView.pause()
        animationView.removeFromSuperview()
        containerView.removeFromSuperview()
    }
}
