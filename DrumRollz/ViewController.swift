//
//  ViewController.swift
//  DrumRollz
//
//  Created by Avi Kasliwal on 03/09/22.
//

import UIKit
import AVFoundation
var player : AVAudioPlayer!

class ViewController: UIViewController {
	
	@IBAction func keyPressed(_ sender: UIButton) {
		// Get which key is pressed
		let drumLetter = sender.titleLabel?.text ?? ""
		
		// Call playSound for key pressed
		playSound(drum: drumLetter)
	}
	
	
	func playSound (drum: String) {
		// Get path of audio file for drum name
		guard let path = Bundle.main.path(forResource: "\(drum)", ofType:"mp3") else { return }
		let url = URL(fileURLWithPath: path)
		
		// Play the file at path - url
		do {
			player = try AVAudioPlayer(contentsOf: url)
			player?.play()
			
		} catch let error {
			print(error.localizedDescription)
		}
	}
}


