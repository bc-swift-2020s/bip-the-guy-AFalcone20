//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Alexander Falcone on 2/3/20.
//  Copyright © 2020 Alexander Falcone. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Mark: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Mark: Functions
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60.0
        
        //Shrink out ImageToPunch by 60pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds }, completion: nil)
    }
    
    func playSound(name: String, audioPlayer: inout AVAudioPlayer) {
           if let sound = NSDataAsset(name: name){
               do {
                   try audioPlayer = AVAudioPlayer(data: sound.data)
                   audioPlayer.play()
               } catch {
                   print("Error: \(error.localizedDescription) could not intialize" )
               }
           }else {
               print("Error: Could not read data")
           }
       }
    
    
    //Mark: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
       animateImage()
        playSound(name: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

