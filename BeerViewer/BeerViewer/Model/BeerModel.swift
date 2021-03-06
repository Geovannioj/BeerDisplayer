//
//  BeerModel.swift
//  BeerViewer
//
//  Created by Geovanni Oliveira de Jesus on 19/02/21.
//  Copyright © 2021 Geovanni Oliveira de Jesus. All rights reserved.
//
import Foundation

struct BeerResponse: Codable {
    var beerArray: [BeerModel]
    
    enum CodingKeys: String, CodingKey {
        case beerArray = ""
    }
}

struct BeerModel: Codable {
    var id: Int
    var name: String?
    var tagline: String?
    var firstBrewed: String?
    var description: String?
    var imgUrl: String?
    var abv: Float?
    var ibu: Float?
    var targetFg: Float?
    var targetOg: Float?
    var ebc: Float?
    var srm: Float?
    var ph: Float?
    var attenuationLevel: Float?
    var volume: Volume?
    var boilVolume: Volume?
    var method: Method?
    var ingredients: Ingredients?
    var foodPairing: [String]?
    var brewersTips: String?
    var contributedBy: String?
    var imgData: Data?
    
    enum CodingKeys: String, CodingKey  {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imgUrl = "image_url"
        case abv
        case ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc
        case srm
        case ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method
        case ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
        case imgData
    }
}

struct Volume: Codable {
    var value: Double
    var unit: String
    
    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}

struct Method: Codable {
    var mashTemp: [MashTemp]
    var fermentation: Fermentation
    var twist: String?
    
    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation
        case twist
    }
}

struct Fermentation: Codable {
    var temp: Volume
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}
struct MashTemp: Codable {
    var temp: Volume
    var duration: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case duration
    }
}

struct Ingredients: Codable {
    var malt: [Malt]
    var hops: [Hops]
    var yeast: String
    
    enum CodingKeys: String, CodingKey {
        case malt
        case hops
        case yeast
    }
}

struct Malt: Codable {
    var name: String
    var amount: Volume
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
    }
}

struct Hops: Codable {
    var name: String
    var amount: Volume
    var add: String
    var attribute: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case add
        case attribute
    }
}
