//
//  ViewController.swift
//  MiamiSunglasses
//
//  Created by Adrian Edwards on 9/25/15.
//  Copyright © 2015 Adrian Edwards. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    var yeah:AVAudioPlayer = AVAudioPlayer()
    var audioURL:URL = Bundle.main.url(forResource: "CSI Miami", withExtension: "mp3")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make sure file exists
        if !FileManager.default.fileExists(atPath: audioURL.path) {print("CSI Miami.mp3 file not found")}

        
        do {
            yeah = try AVAudioPlayer(contentsOf: audioURL, fileTypeHint: nil)
            //yeah.delegate = self; //allows audioPlayerDidFinishPlaying to be called
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)

        } catch _ { return }
        
        yeah.numberOfLoops = 0
        //yeah.volume = 1.0 //interesting... maybe i could add a volume slider later...
        yeah.prepareToPlay()

        
        
    }
    
    @IBAction func playSound(_ sender: AnyObject) {
        if yeah.isPlaying {
            //stop and start over from beginning
            yeah.stop()
            yeah.currentTime = 0;
        } else {
            yeah.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
