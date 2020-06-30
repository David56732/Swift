class Singleton{
    static var a : Singleton = {
        let instance = Singleton()
        return instance
    }()
    private init(){}
}

