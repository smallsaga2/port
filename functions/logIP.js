//functions/logIP.js
exports.handler = async function(event, context) {
    const clientIp = event.headers['x-nf-client-connection-ip'];
    return {
        statusCode: 200,
        body: JSON.stringify({ ip: clientIp })
    };
};
