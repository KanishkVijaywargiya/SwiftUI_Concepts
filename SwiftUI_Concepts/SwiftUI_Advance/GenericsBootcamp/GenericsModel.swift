//
//  GenericsModel.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 04/05/22.
//

import Foundation
import SwiftUI

//this style of writing becomes very repetative. So need to use Generics.

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

/// GENERIC  MODEL
// In PROD App, we can often see <T> which stands for Type / AnyType
struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

/*
struct GenericModel<CustomType> {
    let info: CustomType?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}
 */

