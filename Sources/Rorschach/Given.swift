//
//  Given.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public class Given {

    /// Returns "Given I do this"_ when this _Given_ either has content named _"I do this"_ or the first of its steps is titled _"I do this"_.
    var title: String {
        guard let firstStep = steps.first else { return "Given" }

        if let stepTitle = contentOnlyTitle {
            return "Given " + stepTitle
        }
        return "Given " + (firstStep?.title ?? "")
    }
    var contentOnlyTitle: String?

    /// The _Step_s to be executed as part of the `Given`.
    let steps: [Step?]

    init(steps: [Step?]) {
        self.steps = steps
    }

    /// Shorthand for a `Given` with a single step with some content
    public init(_ title: String, content: @escaping () -> Void) {
        contentOnlyTitle = title
        steps = [Step(content: content)]
    }

    /// Initializes a `Given` block  with the given `Step`s
    public convenience init(@GivenBuilder _ content: () -> [Step?]) {
        self.init(steps: content())
    }

    func execute() {
        steps.forEach { step in
            if step != steps.first, let title = step?.title {
                XCTContext.runActivity(named: "And \(title)" ) { _ in
                    step?.execute()
                }
            } else {
                step?.execute()
            }
        }
    }
}
