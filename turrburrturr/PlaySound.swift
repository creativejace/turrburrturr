
import Foundation
import AVFoundation

// Mark: - AUDIO PLAYER

var audioPlayer: AVAudioPlayer?


func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            print("Sound played")
        } catch {
            print("No sound available")
        }
    }
}
