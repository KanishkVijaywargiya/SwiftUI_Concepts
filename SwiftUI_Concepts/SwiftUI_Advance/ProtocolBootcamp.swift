//
//  ProtocolBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 08/07/22.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .pink
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol {
    var primary: Color = .blue
    var secondary: Color = .pink
    var tertiary: Color = .purple
}

protocol ColorThemeProtocol { //we can't use let inside the protocol, { get set } or { get }
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}


protocol ButtonTextProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol: ButtonTextProtocol, ButtonPressedProtocol {
    
}

class DefaultDataSource: ButtonDataSourceProtocol {
    var buttonText: String = "Protocols are awesome!"
    
    func buttonPressed() {
        print("Button was pressed !!")
    }
}

class AlternativeDataSource: ButtonTextProtocol {
    var buttonText: String = "Protocols are lame!"
}
 
struct ProtocolBootcamp: View {
    //let colorTheme: DefaultColorTheme = DefaultColorTheme()
    //let colorTheme: AlternativeColorTheme = AlternativeColorTheme()
    let colorTheme: ColorThemeProtocol
    //let dataSource: ButtonTextProtocol
    //let dataSource2: ButtonPressedProtocol
    let dataSource: ButtonDataSourceProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            Text(dataSource.buttonText)
                .font(.headline.bold())
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct ProtocolBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ProtocolBootcamp(colorTheme: DefaultColorTheme(), dataSource: AlternativeDataSource(), dataSource2: DefaultDataSource())
        ProtocolBootcamp(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource())
    }
}
