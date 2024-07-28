const net = require('net');

exports.handler = async function(event, context) {
    const { ip, port } = JSON.parse(event.body);
    return new Promise((resolve) => {
        const socket = new net.Socket();
        socket.setTimeout(1000);

        socket.on('connect', () => {
            socket.destroy();
            resolve({
                statusCode: 200,
                body: JSON.stringify({ isOpen: true })
            });
        });

        socket.on('timeout', () => {
            socket.destroy();
            resolve({
                statusCode: 200,
                body: JSON.stringify({ isOpen: false })
            });
        });

        socket.on('error', () => {
            resolve({
                statusCode: 200,
                body: JSON.stringify({ isOpen: false })
            });
        });

        socket.connect(port, ip);
    });
};
