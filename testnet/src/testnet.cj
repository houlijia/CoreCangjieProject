package testnet
import std.socket.*
import std.time.*
import std.sync.*

let SERVER_PORT: UInt16 = 8080

func runTcpServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()

        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, item: 0)
            let count = client.read(buf)

            // 服务端读取到的数据为: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

public func testnet(): Int64 {
    spawn {
        runTcpServer()
    }
    sleep(Duration.millisecond * 500)

    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write(Array<Byte>([1, 2, 3]))
    }
    return 0
}