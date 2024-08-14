//
//  ViewController.swift
//  Ejercicio Diseno interface
//
//  Created by Alex Diaz on 3/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Variables de estado
    private var isLiked: Bool = false
    private var isFollowed: Bool = false
    private var isPlaying: Bool = false
    private var numberOfLikes: Int = 39
    private var numberOfFollowers: Int = 112
    private var numberOfSongs: Int = 203
    private var currentUser: Int = 0

    // views of the music button
    @IBOutlet weak var musicButtonFrame: UIView!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var musicButtonLabel: UILabel!
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songImage2: UIImageView!
    @IBOutlet weak var songImage3: UIImageView!
    
    // views of the artist circles
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBOutlet weak var circleRed: UIView!
    @IBOutlet weak var circleBlue: UIView!
    @IBOutlet weak var circleWhite: UIView!
    
    // views of the song title
    @IBOutlet weak var songTitle1: UILabel!
    @IBOutlet weak var songTitle2: UILabel!
    @IBOutlet weak var songTitle3: UILabel!
    
    @IBOutlet weak var artistName1: UILabel!
    @IBOutlet weak var artistName2: UILabel!
    @IBOutlet weak var artistName3: UILabel!
    
    @IBOutlet weak var songYear1: UILabel!
    @IBOutlet weak var songYear2: UILabel!
    @IBOutlet weak var songYear3: UILabel!
    
    // artist name
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistDescription: UILabel!
    
    // like Button
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeButtonFrame: UIView!
    @IBOutlet weak var likeButtonLabel: UILabel!
    
    // followers button
    @IBOutlet weak var followersButton: UIButton!
    @IBOutlet weak var followersButtonFrame: UIView!
    @IBOutlet weak var followersButtonLabel: UILabel!
    
    func setupSwipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            print("swiped right")
            currentUser += 1
            if currentUser > 2 {
                currentUser = 0
            }
        } else if sender.direction == .left {
            print("swiped left")
            currentUser -= 1
            if currentUser < 0 {
                currentUser = 2
            }
        }
        updateUI()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // make the circle views rounded
        circleRed.layer.cornerRadius = circleRed.frame.height / 2
        circleBlue.layer.cornerRadius = circleBlue.frame.height / 2
        circleWhite.layer.cornerRadius = circleWhite.frame.height / 2
        // making the circle views without background and with a stroke
        circleBlue.layer.backgroundColor = UIColor.clear.cgColor
        circleBlue.layer.borderColor = UIColor.systemGray2.withAlphaComponent(0.2).cgColor

        circleBlue.layer.borderWidth = 2
        circleRed.layer.backgroundColor = UIColor.clear.cgColor
        circleRed.layer.borderColor = UIColor.systemGray2.withAlphaComponent(0.3).cgColor
        circleRed.layer.borderWidth = 2
        circleWhite.layer.backgroundColor = UIColor.clear.cgColor
        circleWhite.layer.borderColor = UIColor.systemGray2.withAlphaComponent(0.1).cgColor
        circleWhite.layer.borderWidth = 2
        // make the image views rounded
        artistImage.contentMode = UIView.ContentMode.scaleAspectFill
        artistImage.layer.cornerRadius = artistImage.frame.height / 2
        artistName.font = UIFont.boldSystemFont(ofSize: 20)

        setupSwipeGestures()
        updateUI()
        
        
    }
    @IBAction func clickLikeButton(_ sender: Any) {
        isLiked.toggle()
        // cambiar el boton de like
        if isLiked {
            numberOfLikes += 1
        } else {
            numberOfLikes -= 1
        }
        updateUI()
    }
    @IBAction func clickFollowerButton(_ sender: Any) {
        isFollowed.toggle()
        if isFollowed {
            numberOfFollowers += 1
        } else {
            numberOfFollowers -= 1
        }
        updateUI()
    }
    
    private func updateUI() {
        // MARK: - Setting up the song
        
        artistImage.image = UIImage(named: users[currentUser].image)
        artistName.text = users[currentUser].name
        artistDescription.text = users[currentUser].description
        
        //establecer el nombre de las canciones
        songTitle1.text = "Listening to \( users[currentUser].songsFavorite[0].name)"
        songTitle2.text = "Listening to \( users[currentUser].songsFavorite[1].name)"
        songTitle3.text = "Listening to \( users[currentUser].songsFavorite[2].name)"
        //establecer el año de las cacniones
        songYear1.text = users[currentUser].songsFavorite[0].year
        songYear2.text = users[currentUser].songsFavorite[1].year
        songYear3.text = users[currentUser].songsFavorite[2].year
        
        // establecer el artista y el album
        artistName1.text = users[currentUser].songsFavorite[0].artist + " - " + users[currentUser].songsFavorite[0].album
        artistName2.text = users[currentUser].songsFavorite[1].artist + " - " + users[currentUser].songsFavorite[1].album
        artistName3.text = users[currentUser].songsFavorite[2].artist + " - " + users[currentUser].songsFavorite[2].album
        
        // establecer la imagenes
        songImage.image = UIImage(named: users[currentUser].songsFavorite[0].image)
        songImage2.image = UIImage(named: users[currentUser].songsFavorite[1].image)
        songImage3.image = UIImage(named: users[currentUser].songsFavorite[2].image)
        // redondear las imagenes
        songImage.layer.cornerRadius = songImage.frame.height / 2
        songImage2.layer.cornerRadius = songImage2.frame.height / 2
        songImage3.layer.cornerRadius = songImage3.frame.height / 2
        
        
        //setting up the like button
        likeButton.setImage(UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        likeButton.tintColor = isLiked ? UIColor.systemRed : .white
        likeButton.contentScaleFactor = isLiked ? 1.5 : 1
        followersButton.setImage(UIImage(systemName: "person.3.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        followersButton.tintColor = isFollowed ? UIColor.systemBlue : .white
        
        likeButtonLabel.text = String(numberOfLikes)
        followersButtonLabel.text = String(numberOfFollowers)
        musicButtonLabel.text = String(numberOfSongs)
        
        //declarar bonito el frame que como si estuviera marcado
        musicButtonFrame.backgroundColor = UIColor.systemGray2
        musicButtonFrame.layer.cornerRadius = musicButtonFrame.frame.height / 4
        
    }
    

}

