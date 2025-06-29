//
//  Foundation+Extensions.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

public typealias Closure = () -> ()
public typealias ReturnClosure<T> = (T) -> ()
public typealias TypeClosure<T> = () -> T
public typealias TypeReturnClosure<T,U> = (U) -> T

public typealias AsyncClosure = () async  -> ()
public typealias AsyncReturnClosure<T> = (T) async  -> ()
public typealias AsyncTypeClosure<T> = () async -> T
public typealias AsyncTypeReturnClosure<T, U> = (U) async -> T


