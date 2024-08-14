//
//  models.swift
//  Ejercicio Diseno interface
//
//  Created by Alex Diaz on 8/8/24.
//

import Foundation

struct Song {
    var name: String
    var artist: String
    var year: String
    var image: String
    var album: String
}

struct User {
    var name: String
    var description: String
    var image: String
    var songsFavorite: [Song]
    var followers: Int
    var likes: Int
    var songAmounts: Int
}
let users: [User] = [
    User(
        name: "Alice Johnson",
        description: "Music lover and vinyl collector.",
        image: "photo",
        songsFavorite: [
            Song(name: "Bad Guy", artist: "Billie Eilish", year: "2019", image: "photo", album: "When We All Fall Asleep?"),
            Song(name: "Uptown Funk", artist: "Bruno Mars", year: "2014", image: "photo", album: "Uptown Special"),
            Song(name: "Royals", artist: "Lorde", year: "2013", image: "photo", album: "Pure Heroine")
        ],
        followers: 1500,
        likes: 3200,
        songAmounts: 150
    ),
    User(
        name: "Michael Brown",
        description: "DJ and electronic music producer.",
        image: "michael_brown_image_url",
        songsFavorite: [
            Song(name: "Strobe", artist: "deadmau5", year: "2009", image: "strobe_image_url", album: "For Lack of a Better Name"),
            Song(name: "Animals", artist: "Martin Garrix", year: "2013", image: "animals_image_url", album: "Gold Skies"),
            Song(name: "Titanium", artist: "David Guetta ft. Sia", year: "2011", image: "titanium_image_url", album: "Nothing but the Beat")
        ],
        followers: 2300,
        likes: 4500,
        songAmounts: 220
    ),
    User(
        name: "Sophie Williams",
        description: "Singer and songwriter.",
        image: "sophie_williams_image_url",
        songsFavorite: [
            Song(name: "Shallow", artist: "Lady Gaga & Bradley Cooper", year: "2018", image: "shallow_image_url", album: "A Star Is Born"),
            Song(name: "Halo", artist: "Beyoncé", year: "2008", image: "halo_image_url", album: "I Am... Sasha Fierce"),
            Song(name: "Someone You Loved", artist: "Lewis Capaldi", year: "2018", image: "someone_you_loved_image_url", album: "Divinely Uninspired to a Hellish Extent")
        ],
        followers: 3200,
        likes: 6000,
        songAmounts: 180
    )
]
