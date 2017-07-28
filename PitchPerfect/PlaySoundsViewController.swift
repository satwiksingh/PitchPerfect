//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Satwik Singh on 08/06/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var SlowButton: UIButton!
    @IBOutlet weak var HighPitchButton: UIButton!
    @IBOutlet weak var FastButton: UIButton!
    @IBOutlet weak var LowPitchButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    
    var recordedAudioURL: URL!
    

    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
            switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }
            
            configureUI(.playing)
        
        
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
                stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    
}
