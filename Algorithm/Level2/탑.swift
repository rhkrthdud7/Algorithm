//
//  탑.swift
//  Algorithm
//
//  Created by Soso on 2020/07/19.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42588

import Foundation

class 탑: Runnable {
    func solution(_ heights: [Int]) -> [Int] {
        var results: [Int] = []

        for i in heights.indices {
            let height = heights[i]

            let range = 0..<i
            if let index = heights[range].lastIndex(where: { $0 > height }) {
                results.append(index + 1)
            } else {
                results.append(0)
            }
        }

        return results
    }

    func run() -> Bool {
        let result = solution([6, 9, 5, 7, 4])
        let expected = [0, 0, 2, 2, 4]
        return result == expected
    }
}
