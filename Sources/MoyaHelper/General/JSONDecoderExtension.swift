//
//  JSONDecoderExtension.swift
//  Meme
//
//  Created by DAO on 2024/8/30.
//

import Foundation

extension JSONDecoder {
    public static let `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }()
}
