//
//  TwoSum-repeat.swift
//  s-coding
//
//  Created by Lee Whitney on 11/24/25.
//

struct TwoSumRepeat {
    init() {
        let nums = [2, 7, 11, 15]
        let target = 9

        p("input:")
        p(nums)
        p(target)
        p()

        if let output = twoSum(nums: nums, target: target) {
            p("answer: \(output)")
        } else {
            p("no answer found")
        }
    }

    func twoSum( nums: [Int], target: Int) -> [Int]? {
        var numMap = [Int:Int]()

        for (i, num) in nums.enumerated() {
            let complement = target - num
            if let index2 = numMap[complement] {
                return [i, index2]
            } else {
                numMap[num] = i
            }
        }
        return nil
    }

    func twoSum_Quadratic( nums: [Int], target: Int) -> [Int]? {

        for i in 0..<nums.count {
            for j in i..<nums.count {
                if i == j {
                    continue
                }
                p("i:\(i) j:\(j)  (\(nums[i]), \(nums[j]))")

                if nums[i] + nums[j] == target {
                    return [i,j]
                }
            }
        }
        return [0,0]
    }
}


