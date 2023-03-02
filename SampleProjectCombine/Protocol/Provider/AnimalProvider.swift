//
//  AnimalProvider.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import Moya

enum AnimalProvider {
    case getAnimals
}

extension AnimalProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/LearnWebCode/json-example/master")!
    }

    var path: String {
        switch self {
            case .getAnimals:
                return "/animals-1.json"
        }
    }

    var method: Moya.Method {
        switch self {
            case .getAnimals:
                return .get
        }
    }

    var task: Moya.Task {
        switch self {
            case .getAnimals:
                return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }
}
