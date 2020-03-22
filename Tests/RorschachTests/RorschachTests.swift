import XCTest
import Rorschach

final class RorschachTests: XCTestCase {

    /// An Example test case.
    ///
    /// This test `expect`s a certain behaviour.
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_iCanSeeTheStars() {
        expect {
            Given {
                ILearnABitMore()
                IBuildARocket()
            }
            When {
                ILaunchARocket()
            }
            Then {
                ICanSeeTheStars()
            }
        }
    }

    static var allTests = [
        ("test_iCanSeeTheStars", test_iCanSeeTheStars),
    ]
}