//
//  실패율.swift
//  Algorithm
//
//  Created by Soso on 2020/07/12.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

class 실패율: Runnable {
    func solution(_ N: Int, _ stages: [Int]) -> [Int] {
        let count = stages.count
        var values = [Float](repeating: 0, count: N + 1)
        var result = Array(1...N)

        for stage in stages {
            values[stage - 1] += 1
        }
        var previous: Float = 0
        for (index, value) in values.enumerated() {
            values[index] = value / (Float(count) - previous)
            previous += value
        }
        result.sort(by: { values[$0 - 1] > values[$1 - 1] })

        return result
    }

    func run() -> Bool {
        let result = solution(5, [2, 1, 2, 6, 2, 4, 3, 3])
        let expected = [3, 4, 2, 1, 5]
        return result == expected
    }
}
