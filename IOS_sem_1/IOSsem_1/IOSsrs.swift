//
//  IOSsrs.swift
//  IOSsem_1
//
//  Created by Мария Беликова on 09.09.2023.
//

final class Student {
      var grades: [Double] = []
      var fullName: String
  
      init(grades: [Double] = [], fullName: String) {
          self.grades = grades
          self.fullName = fullName
      }
  
      func getGrade() -> Double {
          var sum = 0.0
  
          for grade in grades {
              sum += grade
          }
  
          return sum / Double(grades.count)
      }
  }

final class IOSsrs {
    static var students: [Student] = []
    
    static func getNormalizedGrades() -> [String : Double] {
        var normalizedGrades: [String: Double] = [:]
        var maxGrade = IOSsrs.students[0].getGrade()
        
        for student in IOSsrs.students {
            maxGrade = max(maxGrade, student.getGrade())
        }
        
        for student in IOSsrs.students {
            normalizedGrades.updateValue(student.getGrade() / maxGrade * 10, forKey: student.fullName)
        }
        
        return normalizedGrades
    }
}
