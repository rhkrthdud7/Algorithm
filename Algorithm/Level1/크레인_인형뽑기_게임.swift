//
//  크레인_인형뽑기_게임.swift
//  Algorithm
//
//  Created by Soso on 2020/07/12.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/64061

import Foundation

class 크레인_인형뽑기_게임: Runnable {
    func solution(_ board: [[Int]], _ moves: [Int]) -> Int {
        var stacks: [[Int]] = [[Int]](repeating: [], count: board.count)
        var stack: [Int] = []
        var result = 0
        for b in board.reversed() {
            for (i, e) in b.enumerated().reversed() {
                if e != 0 {
                    stacks[i].append(e)
                }
            }
        }
        for move in moves {
            if let current = stacks[move-1].last {
                stacks[move-1].removeLast()
                if let last = stack.last, last == current {
                    stack.removeLast()
                    result += 2
                } else {
                    stack.append(current)
                }
            }
        }

        return result
    }

    func run() -> Bool {
        let result = solution([[0, 0, 0, 0, 0], [0, 0, 1, 0, 3], [0, 2, 5, 0, 1], [4, 2, 4, 4, 2], [3, 5, 1, 3, 1]], [1, 5, 3, 5, 1, 2, 1, 4])
        let expected = 4
        return result == expected
    }
}
