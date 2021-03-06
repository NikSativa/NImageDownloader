import Foundation
import NCallback
import UIKit

public struct ImageInfo {
    public enum Animation: Equatable {
        case crossDissolve
    }

    public enum Placeholder: Equatable {
        case clear
        case ignore
        case image(UIImage)

        public init(_ image: UIImage?) {
            self = image.map { .image($0) } ?? .clear
        }

        public static let `default`: Self = .ignore
    }

    public enum Priority: Comparable {
        case veryLow
        case low
        case normal
        case high
        case veryHight

        public static let `default`: Self = .normal
        public static let prefetch: Self = .veryLow
    }

    public let url: URL
    public let animation: Animation?
    public let cachePolicy: URLRequest.CachePolicy
    public let timeoutInterval: TimeInterval
    public let placeholder: Placeholder
    public let processors: [ImageProcessor]
    public let priority: Priority

    public init(url: URL,
                animation: Animation? = nil,
                cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
                timeoutInterval: TimeInterval = 60,
                placeholder: Placeholder = .default,
                processors: [ImageProcessor] = [],
                priority: Priority = .default) {
        self.url = url
        self.animation = animation
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
        self.placeholder = placeholder
        self.processors = processors
        self.priority = priority
    }
}
