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
            p()
            p("answer: \(output)")
        }
    }

    func twoSum( nums: [Int], target: Int) -> [Int]? {

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


