//
//  AddTwoNumbers.swift
//  s-coding
//
//  Created by Lee Whitney on 3/28/25.
//

import Foundation

//
// Problem #2: Add Two Numbers
//
// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in reverse order, and each node contains a single digit.
// Add the two numbers and return the sum as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Example 1:
// Input: l1 = [2,4,3], l2 = [5,6,4]
// Output: [7,0,8]
// Explanation: 342 + 465 = 807
//
// Example 2:
// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
// Output: [8,9,9,9,0,0,0,1]
// Explanation: 9999999 + 9999 = 10009998
//
// Example 3 (even larger):
// Input: l1 = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
// l2 = [5,6,4]
// Output: [6,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
// Explanation: (10^30+1) + 465 = 10^30+466
//

func addTwoNumbers_Test() {
    let n1 = ListNode(2)
    n1.next = ListNode(4)
    n1.next?.next = ListNode(3)

    let n2 = ListNode(5)
    n2.next = ListNode(6)
    n2.next?.next = ListNode(4)

    printNumList(n1)
    printNumList(n2)
    print()
    let sum = numFromList(n1) + numFromList(n2)
    print("Sum:\n\(sum)")
    print()
    let sumList = addTwoNumbers(n1, n2)
    printNumList(sumList)
}


func addTwoNumbers(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var current1: ListNode? = list1
    var current2: ListNode? = list2
    let sumList: ListNode? = ListNode(0)
    var sumListCurrent = sumList
    var carry = 0

    while current1 != nil || current2 != nil {

        var digit1 = 0, digit2 = 0

        if current1 != nil {
            digit1 = current1!.val
            current1 = current1!.next
        }
        if current2 != nil {
            digit2 = current2!.val
            current2 = current2!.next
        }
        let sumDigit = digit1 + digit2 + carry
        carry = sumDigit / 10

        sumListCurrent?.next = ListNode(sumDigit % 10)
        sumListCurrent = sumListCurrent?.next
    }

    if carry == 1 {
        sumListCurrent?.next = ListNode(1)
    }
    return sumList?.next
}


func copyList(_ list: ListNode?) -> ListNode? {
    var current: ListNode? = list
    let listCopy: ListNode? = ListNode(0)
    var listCopyCurrent = listCopy

    while let node = current {
        listCopyCurrent?.next = ListNode(node.val)
        listCopyCurrent = listCopyCurrent?.next
        current = node.next
    }
    return listCopy?.next
}

//func addTwoNumbers_Test_FirstTry() {
//    let n1 = ListNode(2)
//    n1.next = ListNode(4)
//    n1.next?.next = ListNode(3)
//    
//    let n2 = ListNode(5)
//    n2.next = ListNode(6)
//    n2.next?.next = ListNode(4)
//
//    let sumList = addTwoNumbers(n1, n2)
//
//    printList(sumList)
//}

func addTwoNumbers_FirstTry(_ n1: ListNode?, _ n2: ListNode?) -> ListNode? {
    let num1 = numFromList(n1)
    let num2 = numFromList(n2)
    let sum = num1 + num2
    return listFromNum(sum)
}

func listFromNum(_ num: Int) -> ListNode? {
    let dummy: ListNode? = ListNode(0)
    var tail: ListNode? = dummy
    var q = num

    repeat {
        let m = q % 10
        q = q / 10

        tail?.next = ListNode(m)
        tail = tail?.next
    } while q > 0

    return dummy?.next
}

func numFromList(_ list: ListNode?) -> Int {
    var num = 0
    var base = 1

    var node: ListNode? = list
    while node != nil {
        num += node!.val * base
        base *= 10
        let next: ListNode? = node?.next
        node = next
    }
    return num
}

func printNumList(_ list: ListNode?) {
    let num = numFromList(list)
    let s = listToString(list)
    print("\(num)   \(s)")
}

func printList(_ list: ListNode?) {
    let s = listToString(list)
    print(s)
}

func listToString(_ list: ListNode?) -> String {
    var node: ListNode? = list
    var s = ""
    while node != nil {
        let next: ListNode? = node?.next

        s += "\(node!.val)"

        if next != nil {
            s += " -> "
        }
        node = next
    }
    return s
}
