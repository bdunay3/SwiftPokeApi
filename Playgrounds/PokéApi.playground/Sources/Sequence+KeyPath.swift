import Foundation

extension Sequence {
    public func sorted<T: Comparable>(
        by keyPath: KeyPath<Element, T>,
        using comparison: (T, T) -> Bool)
    -> [Element] {
        return sorted { lhs, rhs in
            comparison(lhs[keyPath: keyPath], rhs[keyPath: keyPath])
        }
    }
    
    public func sorted<T: Comparable>(
        by keyPath: KeyPath<Element, T>,
        order sortOrder: SortOrder)
    -> [Element] {
        
        switch sortOrder {
        case .forward:
            return sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
        case .reverse:
            return sorted { $0[keyPath: keyPath] > $1[keyPath: keyPath] }
        }
    }
}
