//
//  FetchResult.swift
//  AppNetwork
//
//  Created by Kwarteng on 16/09/2025.
//

/// Short circuit for codable results
public typealias FetchResult<T: Codable> = Result<T, Error>
