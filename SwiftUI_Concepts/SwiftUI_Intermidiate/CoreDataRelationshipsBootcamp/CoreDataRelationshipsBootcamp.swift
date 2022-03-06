//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 03/03/22.
//

import SwiftUI

struct CoreDataRelationshipsBootcamp: View {
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    addBusinessButton
                    Business
                    Department
                    Employee
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct CoreDataRelationshipsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipsBootcamp()
    }
}

extension CoreDataRelationshipsBootcamp {
    private var addBusinessButton: some View {
        Button(action: {vm.getEmployees(forBusiness: vm.businesses[0])}) {
            Text("Add Business")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(10))
        }
    }
    private var Business: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:. top) {
                ForEach(vm.businesses) { business in
                    BusinessView(entity: business)
                }
            }
        }
    }
    private var Department: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:. top) {
                ForEach(vm.departments) { department in
                    DepartmentView(entity: department)
                }
            }
        }
    }
    private var Employee: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:. top) {
                ForEach(vm.employees) { employee in
                    EmployeeView(entity: employee)
                }
            }
        }
    }
}

struct BusinessView: View {
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments: ").bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ").bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses: ").bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ").bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            Text("Age: \(entity.age)").bold()
            Text("DOJ: \(entity.dateJoined ?? Date())").bold()
            
            Text("Business: ").bold()
            Text(entity.business?.name ?? "")
            
            Text("Department: ").bold()
            Text(entity.department?.name ?? "")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

/****
 3 entities
 1]. Business Entity
 2]. Department Entity
 3]. Employee Entity
 ***/
