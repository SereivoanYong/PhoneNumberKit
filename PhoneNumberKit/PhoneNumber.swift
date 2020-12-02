//
//  PhoneNumber.swift
//  PhoneNumberKit
//
//  Created by Roy Marmelstein on 26/09/2015.
//  Copyright © 2020 Roy Marmelstein. All rights reserved.
//

import Foundation

/**
 Parsed phone number object

 - string: String used to generate phone number struct
 - countryCode: Country dialing code as an unsigned. Int.
 - leadingZero: Some countries (e.g. Italy) require leading zeros. Bool.
 - nationalNumber: National number as an unsigned. Int.
 - numberExtension: Extension if available. String. Optional
 - type: Computed phone number type on access. Returns from an enumeration - PNPhoneNumberType.
 */
public struct PhoneNumber: Decodable {
    public let string: String
    public let countryCode: Int32
    public let leadingZero: Bool
    public let nationalNumber: UInt64
    public let numberExtension: String?
    public let type: PhoneNumberType
    public let regionCode: String?
}

extension PhoneNumber: Equatable {
    public static func == (lhs: PhoneNumber, rhs: PhoneNumber) -> Bool {
        return (lhs.countryCode == rhs.countryCode)
            && (lhs.leadingZero == rhs.leadingZero)
            && (lhs.nationalNumber == rhs.nationalNumber)
            && (lhs.numberExtension == rhs.numberExtension)
    }
}

extension PhoneNumber: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.countryCode)
        hasher.combine(self.nationalNumber)
        hasher.combine(self.leadingZero)
        if let numberExtension = numberExtension {
            hasher.combine(numberExtension)
        } else {
            hasher.combine(0)
        }
    }
}
