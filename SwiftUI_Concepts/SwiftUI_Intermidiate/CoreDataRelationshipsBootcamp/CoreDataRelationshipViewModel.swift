//
//  CoreDataRelationshipViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 03/03/22.
//

import Foundation
import CoreData

class CoreDataRelationshipViewModel: ObservableObject {
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    let manager = CoreDataManager.instance
    
    init() {
        getBusiness()
        getDepartments()
        getEmployees()
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Facebook"
        
        // add existing departments & employees to the new business
        //newBusiness.departments = [departments[0], departments[1]]
        //newBusiness.employees = [employees[1]]
        
        // add new business to existing departments & employees
        // newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        // newBusiness.addToEmployees(<#T##values: NSSet##NSSet#>)
        
        saveData()
    }
    
    func addDepartments() {
        let newDepartments = DepartmentEntity(context: manager.context)
        newDepartments.name = "Finance"
        newDepartments.businesses = [businesses[0], businesses[1], businesses[3]]
        
        // 2 ways of adding new employee to departments
        // newDepartments.employees = [employees[1]] //-> 1
        newDepartments.addToEmployees(employees[1]) //-> 2
        
        saveData()
    }
    
    func addEmployees() {
        let newEmployees = EmployeeEntity(context: manager.context)
        newEmployees.name = "Ceecilia"
        newEmployees.age = 28
        newEmployees.dateJoined = Date()
        
         newEmployees.business = businesses[3]
         newEmployees.department = departments[1]
        saveData()
    }
    
    func getBusiness() { //<BusinessEntity> is a generic type
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        
        //let filter = NSPredicate(format: "name == %@", "Apple")
        //request.predicate = filter
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getDepartments() { //<DepartmentEntity> is a generic type
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getEmployees() { //<EmployeeEntity> is a generic type
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getEmployees(forBusiness business: BusinessEntity) { //<EmployeeEntity> is a generic type
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        let filter = NSPredicate(format: "business == %@", business)
        request.predicate = filter
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func updateBusiness() {
        let existingBusiness = businesses[3]
        existingBusiness.addToDepartments(departments[1])
        saveData()
    }
    
    func saveData() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.manager.save()
            self.getBusiness()
            self.getDepartments()
            self.getEmployees()
        }
    }
}
