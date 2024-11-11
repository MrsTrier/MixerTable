//
//  MixerTableModels.swift
//  MixerTable
//
//  Created by Daria Cheremina on 10/11/2024.
//

import Foundation

enum MixerTableSection {
    case main
}

struct MixerTableRow: Hashable {
    let name: String
    var flag: Bool

    static let rows: [MixerTableRow] = [
        .init(name: "1", flag: false),
        .init(name: "2", flag: false),
        .init(name: "3", flag: false),
        .init(name: "4", flag: false),
        .init(name: "5", flag: false),
        .init(name: "6", flag: false),
        .init(name: "7", flag: false),
        .init(name: "8", flag: false),
        .init(name: "9", flag: false),
        .init(name: "10", flag: false),
        .init(name: "11", flag: false),
        .init(name: "12", flag: false),
        .init(name: "13", flag: false)
    ]
}
