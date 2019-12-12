import Foundation

public extension String {

    func isEmail() -> Bool {
        return match(Regex.email.pattern)
    }

    func isNumber() -> Bool {
        return match(Regex.number.pattern)
    }
    
    func isFullName() -> Bool {
        return match(Regex.fullNames.pattern)
    }
    
    func splitStringIntoArray(_ string: String) -> [String] {
       return string.components(separatedBy: " - ")
    }
}
