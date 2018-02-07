//: ## 1.    코드 포멧팅
//: - - -
/*:
 - Callout(1.1):
  탭에 4칸 공백을 사용 한다.
 */
/*:
 - Callout(1.2):
  한 줄은 최대 160자를 초과하지 않는다.
 
 (Xcode -> Prefercences -> Text Editing -> Page guide at column: 160)
*/
/*:
 - Callout(1.3):
 파일 끝은 줄바꿈으로 종료 한다.
 
*/
/*:
 어느 곳에도 후행 공백이 없도록 한다.
 
 (Xcode -> Preferences -> Text Editing -> Automatically trim trailing whitespace + Including whitespace-only lines)
 */
/*:
 - Callout(1.5):
 새 줄은 중괄호로 시작하지 않는다. ([1TBS 스타일](https://en.m.wikipedia.org/wiki/indentation_style#1TBS)을 사용한다.)
 */
class SomeClass {
    let x = ""
    let y = ""
    let z = ""
    func someMethod() {
        if x == y {
            // ...
        } else if x == z {
            // ...
        } else {
            // ...
        }
    }

    // ...
}

/*:
 - Callout(1.6):
 Property, constant, variable, dictionary, 함수 인수, 프로토콜 적합성 또는 수퍼 클래스에 대한 유형 기술시 콜론 앞에 공백을 추가 하지 않는다.
 
 */
import Foundation
import UIKit

// supper class
class PrivateViewController: UIViewController {
    // ...
}

// 프로토콜
extension PrivateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.cellForRow(at: indexPath)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

// 타입 지정
let privateViewController: PrivateViewController

// 왼쪽 정렬
let myDictionary: [String: Any] = [
    "fiveHundred": 500,
    "oneHundred": 100
]

// 함수 선언
func myFunction<T: Container , U: SomeProtocol>(firstArgument: U, secondArgument: T) where T.RelatedType == U {
    /* ... */
}

// 함수 호출
someFunction(someArgument: "Kitten")

/*:
 - Callout(1.7):
 쉼표 뒤에 공백을 삽입 한다.
 
 */
let myArray = [1, 2, 3, 4, 5]

/*:
 - Callout(1.8):
 `+`, `==` 또는 `->` 와 같은 이항 연산자 뒤 공백이 있어야 하며, 또한 `(` 뒤 와 `)` 앞에는 공백이 없어야 한다.
 
 */
let myValue = 20 + (20 / 2) * 3
if 1 + 1 == 3 {
    fatalError("해가 서쪽에서 떳어요.")
}
func pancake(with syrup: Syrup) -> Pancake {
    return Pancake()
}

/*:
 - Callout(1.9):
 Xcode의 들여쓰기 스타일 사용 한다. (예. CTRL-I를 눌렀을때 코드 변화가 없어야 함). 여러 줄에 걸쳐있는 함수를 선언 할 때 Xcode가 기본값으로 사용되는 구문을 사용 한다.
 
 */
// 여러 줄에 걸쳐있는 함수 선언에 대한 Xcode의 들여 쓰기
func myFunctionWithManyParameters(parameterOne: String,
                                  parameterTwo: String,
                                  parameterThree: String) {
    print("\(parameterOne) \(parameterTwo) \(parameterThree)")
    
    let myFirstValue = 10
    let mySecondValue = 20
    let myThirdValue = 30
    let myForthValue = 40
    
    // 여러 줄의 `if` 문에 대한 Xcode의 들여 쓰기
    if myFirstValue > (mySecondValue + myThirdValue)
        && myForthValue == 100 {
        print("\(myFirstValue)")
    }
}

/*:
 - Callout(1.10):
 매개 변수가 많은 함수를 호출할 때 각 인자를 들여쓰기된 별도의 줄에 넣는다.
 
 */
myFunctionWithManyParameters(
    parameterOne: "Hello",
    parameterTwo: "My Name is",
    parameterThree: "Swift")

/*:
 - Callout(1.11):
 여러 라인으로 기술 되는 충분히 큰 배열, 사전을 인자로 받는 함수는 다음과 같이 각 요소의 `[` 와 `]`를 중괄로와 같이 취급한다. 클로저도 비슷한 방식으로 취급한다.
 
 */
myFunctionwithABunchOfArguments(
    someStringArgument: "Hello",
    someArrayArgument: [
        "This is an array",
        "1234",
        "Show me the money"
    ],
    someDictionaryArgument: [
        "key1": "value 1",
        "key2": "value 2"
    ],
    someClosure: { parameter1 in
        print("\(parameter1)")
    }
)

/*:
 - Callout(1.12):
 다중 행의 조건 비교의 경우 지역 상수 등을 가능하면 사용 한다.
 
 */
// 선호 방식
func myPreferedFunctionA(parameterOne x: Int,
                         parameterTwo y: Int,
                         parameterThree z: Int) {
    
    let firstCondition = x == firstReallyReallyLongPredicateFunction()
    let secondCondition = y == secondReallyReallyLongPredicateFunction()
    let thirdCondition = z == thridReallyReallyLongPredicateFunction()
    if firstCondition && secondCondition && thirdCondition {
        // ...
    }
}
// 비선호 방식
func myNotPreferedFunctionA(parameterOne x: Int,
                            parameterTwo y: Int,
                            parameterThree z: Int) {

    if x == firstReallyReallyLongPredicateFunction()
        && y == secondReallyReallyLongPredicateFunction()
        && z == thridReallyReallyLongPredicateFunction() {
        // ...
    }
}

//: [Next](@next)
