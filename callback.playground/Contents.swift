import UIKit

var str = "Hello, playground"

//--------simple method
//struct TestProvider {
//    func loadImages(url: String, completion: @escaping (String) -> Void){
//        completion("Succesfully called after completion.");
//    }
//}
//
//let testProvider = TestProvider();
//
//testProvider.loadImages(url: "/api/v1/images") { (response) in
//    print(response);
//}


//--------second method
class TestProvider:NSObject {
    typealias testCallBack = (_ status:Bool,_ message:String) -> Void;
    var mainCallback:testCallBack?
    
    func verifyUserWith(_ username: String, _ password: String){
        if username == "nihal" && password == "1234" {
            self.mainCallback?(true, "User is verified")
        }else{
            self.mainCallback?(false, "User is not verified.")
        }
    }
    
    func completionHandler(callBack: @escaping testCallBack){
        self.mainCallback = callBack
    }
}

var testProvider = TestProvider()

testProvider.completionHandler { (status, response) in
    if(status){
        print(response);
    }else{
        print(response)
    }
}

testProvider.verifyUserWith("nihal", "123456");
