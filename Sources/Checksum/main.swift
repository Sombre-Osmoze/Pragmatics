//
//  Checksum.swift
//  Checksum
//
//  Created by Marcus Florentin on 10/06/2020.
//

import Foundation
import Crypto

let arguments = ProcessInfo.processInfo.arguments.dropFirst()
var urls : [URL] = try arguments.map { argument -> URL in
	let url = URL(fileURLWithPath: argument)

//	guard FileManager.default.fileExists(atPath: argument) else {
//		throw FileE
//	}

	return url
}

let data = try urls.map({ try Data(contentsOf: $0) }).reduce(Data(), +)

let digest = SHA256.hash(data: data)

print(digest)
