package testT

public interface I1<T> {
    static func C1func<T>() { 
    }
}
class C1<T> <:I1<T>{
    func C1fun<T>(a:T) {
        var aa:T=a
    }
}

public func testT(): Int64 {
    var c1var01=C1<Int64>()
    c1var01.C1fun<Int64>(10)
    println("hello world")
    return 0
}