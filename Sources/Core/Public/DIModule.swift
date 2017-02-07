//
//  DIModule.swift
//  DITranquillity
//
//  Created by Alexander Ivlev on 16/06/16.
//  Copyright © 2016 Alexander Ivlev. All rights reserved.
//

public protocol DIModule: class {
  var scope: DIModuleScope { get }
  
  func load(builder: DIContainerBuilder)
}

public extension DIModule {
  var scope: DIModuleScope { return .internal }
}

public extension DIContainerBuilder {
  public func register(module: DIModule) {
    if !ignore(uniqueKey: module.uniqueKey) {
      module.load(builder: self)
    }
  }
}

internal extension DIModule {
  internal var uniqueKey: String { return String(describing: type(of: self)) }
}
