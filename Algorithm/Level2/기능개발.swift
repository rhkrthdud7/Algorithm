//
//  기능개발.swift
//  Algorithm
//
//  Created by Soso on 2020/07/17.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42586

import Foundation

class 기능개발: Runnable {
    func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
        let days = zip(progresses, speeds).map { Int(ceil(Double(100 - $0) / Double($1))) }

        var results: [Int] = []
        var last = -1
        for day in days {
            if day > last {
                results.append(1)
                last = day
            } else {
                let index = results.count - 1
                results[index] += 1
            }
        }

        return results
    }

    func run() -> Bool {
        let result = solution([93, 30, 55], [1, 30, 5])
        let expected = [2, 1]
        return result == expected
    }
}
