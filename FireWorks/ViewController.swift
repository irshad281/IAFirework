//
//  ViewController.swift
//  FireWorks
//
//  Created by preeti rani on 08/05/17.
//  Copyright © 2017 Innotical. All rights reserved.
//

import UIKit
import QuartzCore
let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(timeInterval: 0.33, target: self, selector: #selector(generateImage), userInfo: nil, repeats: true)
    }
    
    func generateImage(){
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: screen_height - 10, width: 8, height: 8))
        imageView.contentMode = .scaleAspectFit
        let randomColor = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        let randomY = screen_width*CGFloat(drand48())
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.center = CGPoint.init(x: randomY, y: screen_height + 20)
        imageView.backgroundColor = randomColor
        self.view.addSubview(imageView)
        UIView.animate(withDuration: drand48() , delay: 0.0, options: .curveEaseOut, animations: {
            let randomY = screen_height*CGFloat(drand48())
            imageView.center = CGPoint.init(x: imageView.center.x, y: randomY)
        }, completion: { (completed) in
            print(self.index)
            self.explosed(imageView: imageView)
        })
    }
    
    func explosed(imageView:UIImageView){
        imageView.isHidden = true
        for _ in  1...100{
            let explodedImgView = UIImageView.init()
            explodedImgView.frame = CGRect.init(x: 0, y: 0, width: 4, height: 4)
            explodedImgView.layer.cornerRadius = 2
            explodedImgView.clipsToBounds = true
            explodedImgView.backgroundColor =  UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
            var animatedcenter:CGPoint!
            explodedImgView.center = imageView.center
            var randomY:CGFloat!
            var randomX:CGFloat!
            if drand48() > 0.25{
                randomX = imageView.center.x  - CGFloat(drand48())*50
                randomY = imageView.center.y  - CGFloat(drand48())*50
            }else if drand48() > 0.5{
                randomX = imageView.center.x  - CGFloat(drand48())*50
                randomY = imageView.center.y  + CGFloat(drand48())*50
            }else if drand48() > 0.75{
                randomX = imageView.center.x  + CGFloat(drand48())*50
                randomY = imageView.center.y  - CGFloat(drand48())*50
            }else{
                randomX = imageView.center.x  + CGFloat(drand48())*50
                randomY = imageView.center.y  + CGFloat(drand48())*50
            }
            animatedcenter = CGPoint.init(x: randomX, y: randomY)
            self.view.addSubview(explodedImgView)
            UIView.animate(withDuration: drand48(), delay: 0, options: .curveEaseOut, animations: {
               explodedImgView.center = animatedcenter
            }, completion: { (completed) in
                explodedImgView.removeFromSuperview()
                imageView.removeFromSuperview()
            })
        }
    }
}

