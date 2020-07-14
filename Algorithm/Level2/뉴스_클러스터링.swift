//
//  뉴스_클러스터링.swift
//  Algorithm
//
//  Created by Soso on 2020/07/14.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/17677

import Foundation

class 뉴스_클러스터링: Runnable {
    func solution(_ str1: String, _ str2: String) -> Int {
        var first = [String]()
        var second = [String]()

        let arr1 = Array(str1).map(String.init)
        for i in 0..<arr1.count - 1 {
            let value = (arr1[i] + arr1[i + 1]).lowercased()
            if value.rangeOfCharacter(from: CharacterSet.letters.inverted, options: []) == nil {
                first.append(value)
            }
        }
        let arr2 = Array(str2).map(String.init)
        for i in 0..<arr2.count - 1 {
            let value = (arr2[i] + arr2[i + 1]).lowercased()
            if value.rangeOfCharacter(from: CharacterSet.letters.inverted, options: []) == nil {
                second.append(value)
            }

        }
        
        let total = first.count + second.count
        var intersection = 0
        for e in second {
            if first.contains(e) {
                let index = first.firstIndex(of: e)!
                first.remove(at: index)
                intersection += 1
            }
        }
        guard total > 0 else {
            return 65536
        }
        
        return Int(Double(intersection) / Double(total - intersection) * 65536)
    }

    func run() -> Bool {
        let result = solution("FRANCE", "french")
        let expected = 16384
        return result == expected
    }
}
