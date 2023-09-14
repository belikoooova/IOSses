//
//  ViewController.swift
//  IOSsem_1
//
//  Created by Мария Беликова on 08.09.2023.
//

import UIKit
 
 class ViewController: UIViewController {
 
     override func viewDidLoad() {
         super.viewDidLoad()
         print(normalizeGrades())
     }
 
 
     func normalizeGrades() -> [String: Double] {
         IOSsrs.students = [
             Student(grades: [8, 10, 9], fullName: "Стив Джобс"),
             Student(grades: [7, 8, 7.5, 6], fullName: "Стив Возняк"),
             Student(grades: [4, 6, 5], fullName: "Рональд Уэйн")
         ]
 
         return IOSsrs.getNormalizedGrades()
     }
 }
