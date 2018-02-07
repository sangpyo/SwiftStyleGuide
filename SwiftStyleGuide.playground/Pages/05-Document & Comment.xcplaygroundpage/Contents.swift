//: [Previous](@previous)
/*:
 ## 5.    문서와 코멘트
 - - -

 */
/*:
 ### 5.1    문서
 - - -
 함수가 단순한 O (1) 연산보다 복잡하다면, 메소드 시그니처를 즉각 명확하게 인지할 수 없는 정보가있을 수 있으므로 일반적으로 함수에 대한 주석을 추가하는 것을 고려 한다.
 
 기술적으로 흥미롭고 까다롭지 않고 명백하지 않은지 여부와 상관없이 무언가가 구현되었다면 이를 문서화 한다.
 
 복잡한 클래스 / 구조체 / 열거 형 / 프로토콜 및 속성에 대한 설명을 추가 한다.
 
 시그니처 / 이름으로 기능과 의미를 명확하게 알 수 없는 모든 public function / classes / properties / constants / structs / enums / protocols / 기타 사항을 문서화 한다.
 
 문서 주석을 작성한 후에는 function / property / class 등의 옵션의 클릭 해서 모든 것이 올바르게 형식화되었는지 확인 한다.
 
 Apple의 문서에 설명 된 [Swift의 주석 마크 업](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/Attention.html#//apple_ref/doc/uid/TP40016497-CH29-SW1)에서 사용할 수있는 모든 기능을 확인 한다.
 
 */
/*:
 - Callout(5.1.1):
 컬럼 당 160 글자로 제한 한다.
 */
/*:
 - Callout(5.1.2):
 문서 주석은 한 줄이라 하더라도 다음과 같은 코멘트 블럭을 사용한다.
 */
/** Comment here */
/*:
 - Callout(5.1.3):
 개별 코멘트 라인에 `*`를 프리픽스로 붙이지 않는다.
 */
/*:
 - Callout(5.1.4):
 새로운 `- parameter` 문법을 사용한다. (구식 방식인 `:param:` 대신에) (소문자 `parameter` 이니 주의)
 
 메소드에 Option-click 을 하면 작성한 도움말을 즉시 확인 할 수 있다.
 */
/**
 This is human class
 
 */
class Human {
    /**
     This method feeds a certain food to a person.
     
     - parameter food: The food you want to be eaten.
     - parameter person: The person who should eat the food.
     - returns: True if the food was eaten by the person; false otherwise.
     */
    func feed(_ food: Food, to person: Human) -> Bool {
        // ...
        return false
    }
}
/*:
 - Callout(5.1.5):
 메서드의 매개 변수 / 반환 값 / 반환 값을 문서화하려는 경우 일부 문서가 다소 반복적으로 끝나는 경우에도 문서를 모두 문서화 한다.
 
 때로는 하나의 매개 변수만으로 문서화가 보장되는 경우 대신 설명에 언급하는 것이 더 나을 수도 있다.
 */
/*:
 - Callout(5.1.6):
 복잡한 클래스의 경우 적절한 것으로 보이는 몆 가지 예를 들어 사용법을 설명한다.
 
 Swift의 주석 문서에서 Markdown 문법이 유효하므로, 개행 문자, 목록 등을 적절히 사용한다.
 */
//: 예:
/**
 ## Feature Support
 
 This class does some awesome things. It supports:
 
 - Feature 1
 - Feature 2
 - Feature 3
 
 ## Examples
 
 Here is an example use case indented by four spaces because that indicates a
 code block:
 
 let myAwesomeThing = MyAwesomeClass()
 myAwesomeThing.makeMoney()
 
 ## Warnings
 
 There are some things you should be careful of:
 
 1. Thing one
 2. Thing two
 3. Thing three
 */
class MyAwesomeClass {
    /* ... */
}
/*:
 - Callout(5.1.7):
 code 주석에는 `을 사용한다.
 */
/**
 This does something with a `UIViewController`, perchance.
 - warning: Make sure that `someValue` is `true` before running this function.
 */
func myFunction() {
    /* ... */
}
/*:
 - Callout(5.1.8):
 주석 문서는 간결하게 작성한다.
 */
/*:
 ### 5.2    코멘트
 - - -
 */
/*:
 - Callout(5.2.1):
 `// ` 다음에는 공백을 둔다.
 */
/*:
 - Callout(5.2.2):
 해당 라인에 주석을 남긴다.
 */
/*:
 - Callout(5.2.3):
 `// MARK: - 어쩌구 저쩌구` 를 작성할때 다음 줄을 공백으로 비워둔다.
 */
class Pirate {
    
    // MARK: - instance properties
    
    private let pirateName: String
    
    // MARK: - initialization
    
    init() {
        /* ... */
        pirateName = "잭 스패로우"
    }
    
}
//: [Next](@next)
