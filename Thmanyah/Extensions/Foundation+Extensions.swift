//
//  Foundation+Extensions.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

public typealias Closure = () -> ()
public typealias ReturnClosure<T> = (T) -> ()
public typealias ReturnTypeClosure<T> = () -> T

public typealias AsyncClosure = () async  -> ()
public typealias AsyncReturnClosure<T> = (T) async  -> ()
public typealias AsyncReturnTypeClosure<T> = () async -> T


