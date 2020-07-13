//
//  수식_최대화.swift
//  Algorithm
//
//  Created by Soso on 2020/07/13.
//  Copyright © 2020 Soso. All rights reserved.
//
//  https://programmers.co.kr/learn/courses/30/lessons/67257

import Foundation

class 수식_최대화: Runnable {
    func solution(_ expression: String) -> Int64 {
        let cases = ["*+-", "*-+", "+*-", "+-*", "-*+", "-+*"]
        let operands = expression.split(whereSeparator: {!$0.isNumber}).map{Int64($0)!}
        let operators = expression.split(whereSeparator: {$0.isNumber}).map{String($0)}

        var answer: Int64 = 0
        cases.forEach { ops in
            var tempOperands = operands
            var tempOperators = operators
            ops.forEach { op in
                var index = tempOperators.firstIndex(of: String(op)) ?? -1
                var result: Int64
                while index >= 0 {
                    switch op {
                    case "*": result = tempOperands[index] * tempOperands[index + 1]
                    case "+": result = tempOperands[index] + tempOperands[index + 1]
                    case "-": result = tempOperands[index] - tempOperands[index + 1]
                    default: result = 0
                    }
                    tempOperands[index + 1] = result
                    tempOperands.remove(at: index)
                    tempOperators.remove(at: index)
                    index = tempOperators.firstIndex(of: String(op)) ?? -1
                }
            }
            answer = max(answer, abs(tempOperands[0]))
        }

        return answer
    }

    func run() -> Bool {
        let result = solution("100-200*300-500+20")
        let expected = 60420
        return result == expected
    }
}
