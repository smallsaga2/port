exports.handler = async function(event) {
    const clientIP = event.headers['x-forwarded-for'] || event.headers['client-ip'];
    return {
        statusCode: 200,
        body: JSON.stringify({ ip: clientIP })
    };
};
