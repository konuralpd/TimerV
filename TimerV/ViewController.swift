//
//  ViewController.swift
//  TimerV
//
//  Created by Mac on 28.06.2022.
//

import UIKit


class ViewController: UIViewController {

    var timer: Timer!
    var seconds = 60.00
    
    let timeLabel = UILabel()
    let startButton = UIButton()
    let restartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stopImage = UIImageView(image: UIImage(named: "stopwatch")?.withRenderingMode(.alwaysOriginal))
        
                
        startButton.frame = CGRect(x: self.view.frame.midX - 175, y: view.frame.midY - 50, width: 100, height: 100)
        
        configureGradientLayer()
        viewSetUp()

        view.addSubview(stopImage)
        stopImage.frame = CGRect(x: self.view.frame.maxX - 300, y: self.view.frame.maxY - 250, width: 250, height: 250)
      
    }


    private func viewSetUp() {
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let restartButton = UIButton(frame: CGRect(x: self.view.frame.midX + 75, y: self.view.frame.midY - 50, width: 100, height: 100))
        
        //Butonlarımızı kostumuze edelim
        
        startButton.backgroundColor = UIColor.black
        startButton.setTitle("Başlat", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.addTarget(self, action: #selector(startCount), for: .touchUpInside)
        startButton.layer.cornerRadius = 20
        
        stopButton.backgroundColor = UIColor.black
        stopButton.setTitle("Durdur", for: .normal)
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        stopButton.center = self.view.center
        stopButton.layer.cornerRadius = 20
        
        
        restartButton.backgroundColor = UIColor.black
        restartButton.setTitle("Başa Sar", for: .normal)
        restartButton.setTitleColor(.white, for: .normal)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        restartButton.layer.cornerRadius = 20
        
        
        self.view.addSubview(startButton)
        self.view.addSubview(stopButton)
        self.view.addSubview(restartButton)
        
        timeLabel.text = "60.00"
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "GeezaPro", size: 48)
        
        timeLabel.frame = CGRect(x: self.view.center.x - 75, y: self.view.center.y - 150, width: 150, height: 40)
        self.view.addSubview(timeLabel)
        
     
    }
    
    
    
    @objc func stopTimer() {
        
        timer.invalidate()
        
        startButton.isEnabled = true
    }
    
    @objc func restartTimer() {
        
        seconds = 60.00

        timeLabel.text = "60.00"
        timer.invalidate()
        
        startButton.isEnabled = true
    }
    
    @objc func startCount(sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startButton.isEnabled = true
        
    }
    
    @objc func updateTimer() {
        
        let myTimerFloat = String(format: "%.2f", seconds)
        seconds -= 0.01
        timeLabel.text = myTimerFloat
        
        if seconds <= 0.01 {
            timer.invalidate()
            seconds = 60
            timeLabel.text = "60.00"
        }
    }
    
    func configureGradientLayer(){
        view.backgroundColor = .clear
         let gradient = CAGradientLayer()
         gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
         gradient.locations = [0, 1]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
     }
    
}


