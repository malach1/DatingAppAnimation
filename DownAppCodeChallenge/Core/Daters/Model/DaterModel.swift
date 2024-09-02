//
//  DaterModel.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation

struct DaterModel {
    var dater: Dater
}

extension DaterModel: Identifiable {
    var id: String { return "\(dater.userId )"}
}
