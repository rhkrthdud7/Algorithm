//
//  프린터.swift
//  Algorithm
//
//  Created by Soso on 2020/07/15.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

class 프린터: Runnable {
    func solution(_ priorities: [Int], _ location: Int) -> Int {
        var priority = priorities.sorted(by: >)
        var queue = priorities.enumerated().map { ($0, $1) }
        var result = 0

        while !queue.isEmpty {
            if queue.first!.1 == priority.first! {
                if queue.first!.0 == location {
                    return result + 1
                }
                result += 1
                queue.removeFirst()
                priority.removeFirst()
            } else {
                queue.append(queue.removeFirst())
            }
        }

        return 0
    }

    func run() -> Bool {
        let result = solution([2, 1, 3, 2], 2)
        let expected = 1
        return result == expected
    }
}
