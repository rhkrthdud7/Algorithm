//
//  다트_게임.swift
//  Algorithm
//
//  Created by Soso on 2020/07/12.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/17682

import Foundation

class 다트_게임: Runnable {
    func solution(_ dartResult: String) -> Int {
        let pattern = "\\d+[SDT][*#]*"
        var values: [Int] = []

        let elements = matches(for: pattern, in: dartResult)
        for (i, e) in elements.enumerated() {
            let start = e.startIndex
            var opIndex = e.index(start, offsetBy: 1)
            if e[opIndex] == "0" {
                opIndex = e.index(start, offsetBy: 2)
            }
            let opChar = e[opIndex]
            let value = Int(e[e.startIndex..<opIndex])!
            if opChar == "S" {
                values.append(value)
            } else if opChar == "D" {
                values.append(value * value)
            } else {
                values.append(value * value * value)
            }
            let spIndex = e.index(opIndex, offsetBy: 1)
            if spIndex != e.endIndex {
                let spChar = e[spIndex]
                if spChar == "*" {
                    values[i] *= 2
                    if i > 0 {
                        values[i - 1] *= 2
                    }
                } else if spChar == "#" {
                    values[i] *= -1
                }
            }
        }

        return values.reduce(0, +)
    }

    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                range: NSRange(text.startIndex..., in: text))
            return results.map { String(text[Range($0.range, in: text)!]) }
        } catch {
            return []
        }
    }

    func run() -> Bool {
        let result = solution("1S2D*3T")
        let expected = 37
        return result == expected
    }
}
