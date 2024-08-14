module http_status;

enum HttpStatus
{
    unknown = ushort.min,
    continue_ = 100,
    switchingProtocols = 101,
    processing = 102,
    earlyHints = 103,
    ok = 200,
    created = 201,
    accepted = 202,
    nonAuthoritativeInformation = 203,
    noContent = 204,
    resetContent = 205,
    partialContent = 206,
    multiStatus = 207,
    alreadyReported = 208,
    imUsed = 226,
    multipleChoices = 300,
    movedPermanently = 301,
    found = 302,
    seeOther = 303,
    notModified = 304,
    useProxyDeprecated = 305,
    unused = 306,
    temporaryRedirect = 307,
    permanentRedirect = 308,
    badRequest = 400,
    unauthorized = 401,
    paymentRequiredExperimental = 402,
    forbidden = 403,
    notFound = 404,
    methodNotAllowed = 405,
    notAcceptable = 406,
    proxyAuthenticationRequired = 407,
    requestTimeout = 408,
    conflict = 409,
    gone = 410,
    lengthRequired = 411,
    preconditionFailed = 412,
    payloadTooLarge = 413,
    uriTooLong = 414,
    unsupportedMediaType = 415,
    rangeNotSatisfiable = 416,
    expectationFailed = 417,
    iAmATeapot = 418,
    misdirectedRequest = 421,
    unprocessableContent = 422,
    locked = 423,
    failedDependency = 424,
    tooEarlyExperimental = 425,
    upgradeRequired = 426,
    preconditionRequired = 428,
    tooManyRequests = 429,
    requestHeaderFieldsTooLarge = 431,
    unavailableForLegalReasons = 451,
    internalServerError = 500,
    notImplemented = 501,
    badGateway = 502,
    serviceUnavailable = 503,
    gatewayTimeout = 504,
    httpVersionNotSupported = 505,
    variantAlsoNegotiates = 506,
    insufficientStorage = 507,
    loopDetected = 508,
    notExtended = 510,
    networkAuthenticationRequired = 511
}

string toString(HttpStatus status)
{
    import std.regex;
    import std.string;
    import std.conv;

    string camelCaseToSpace(Captures!(string) m)
    {
        return " " ~ m.hit;
    }
    if (status == HttpStatus.ok)
        return "OK";

    if (status == HttpStatus.iAmATeapot)
        return "I'm a teapot";

    if (status == HttpStatus.continue_)
        return "Continue";

    if (status == HttpStatus.imUsed)
        return "IM Used";

    if (status == HttpStatus.uriTooLong)
        return "URI Too Long";

    if (status == HttpStatus.httpVersionNotSupported)
        return "HTTP Version Not Supported";

    auto name = replaceAll!(camelCaseToSpace)(status.to!string, regex("[A-Z]"));
    return name[0..1].toUpper ~ name[1..$];
}

unittest
{
    assert(HttpStatus.unknown == 0);
    assert(HttpStatus.continue_ == 100);
    assert(HttpStatus.switchingProtocols == 101);
    assert(HttpStatus.processing == 102);
    assert(HttpStatus.earlyHints == 103);
    assert(HttpStatus.ok == 200);
    assert(HttpStatus.created == 201);
    assert(HttpStatus.accepted == 202);
    assert(HttpStatus.nonAuthoritativeInformation == 203);
    assert(HttpStatus.noContent == 204);
    assert(HttpStatus.resetContent == 205);
    assert(HttpStatus.partialContent == 206);
    assert(HttpStatus.multiStatus == 207);
    assert(HttpStatus.alreadyReported == 208);
    assert(HttpStatus.imUsed == 226);
    assert(HttpStatus.multipleChoices == 300);
    assert(HttpStatus.movedPermanently == 301);
    assert(HttpStatus.found == 302);
    assert(HttpStatus.seeOther == 303);
    assert(HttpStatus.notModified == 304);
    assert(HttpStatus.useProxyDeprecated == 305);
    assert(HttpStatus.unused == 306);
    assert(HttpStatus.temporaryRedirect == 307);
    assert(HttpStatus.permanentRedirect == 308);
    assert(HttpStatus.badRequest == 400);
    assert(HttpStatus.unauthorized == 401);
    assert(HttpStatus.paymentRequiredExperimental == 402);
    assert(HttpStatus.forbidden == 403);
    assert(HttpStatus.notFound == 404);
    assert(HttpStatus.methodNotAllowed == 405);
    assert(HttpStatus.notAcceptable == 406);
    assert(HttpStatus.proxyAuthenticationRequired == 407);
    assert(HttpStatus.requestTimeout == 408);
    assert(HttpStatus.conflict == 409);
    assert(HttpStatus.gone == 410);
    assert(HttpStatus.lengthRequired == 411);
    assert(HttpStatus.preconditionFailed == 412);
    assert(HttpStatus.payloadTooLarge == 413);
    assert(HttpStatus.uriTooLong == 414);
    assert(HttpStatus.unsupportedMediaType == 415);
    assert(HttpStatus.rangeNotSatisfiable == 416);
    assert(HttpStatus.expectationFailed == 417);
    assert(HttpStatus.iAmATeapot == 418);
    assert(HttpStatus.misdirectedRequest == 421);
    assert(HttpStatus.unprocessableContent == 422);
    assert(HttpStatus.locked == 423);
    assert(HttpStatus.failedDependency == 424);
    assert(HttpStatus.tooEarlyExperimental == 425);
    assert(HttpStatus.upgradeRequired == 426);
    assert(HttpStatus.preconditionRequired == 428);
    assert(HttpStatus.tooManyRequests == 429);
    assert(HttpStatus.requestHeaderFieldsTooLarge == 431);
    assert(HttpStatus.unavailableForLegalReasons == 451);
    assert(HttpStatus.internalServerError == 500);
    assert(HttpStatus.notImplemented == 501);
    assert(HttpStatus.badGateway == 502);
    assert(HttpStatus.serviceUnavailable == 503);
    assert(HttpStatus.gatewayTimeout == 504);
    assert(HttpStatus.httpVersionNotSupported == 505);
    assert(HttpStatus.variantAlsoNegotiates == 506);
    assert(HttpStatus.insufficientStorage == 507);
    assert(HttpStatus.loopDetected == 508);
    assert(HttpStatus.notExtended == 510);
    assert(HttpStatus.networkAuthenticationRequired == 511);

    assert(HttpStatus.unknown.toString == "Unknown");
    assert(HttpStatus.continue_.toString == "Continue");
    assert(HttpStatus.switchingProtocols.toString == "Switching Protocols");
    assert(HttpStatus.processing.toString == "Processing");
    assert(HttpStatus.earlyHints.toString == "Early Hints");
    assert(HttpStatus.ok.toString == "OK");
    assert(HttpStatus.created.toString == "Created");
    assert(HttpStatus.accepted.toString == "Accepted");
    assert(HttpStatus.nonAuthoritativeInformation.toString == "Non Authoritative Information");
    assert(HttpStatus.noContent.toString == "No Content");
    assert(HttpStatus.resetContent.toString == "Reset Content");
    assert(HttpStatus.partialContent.toString == "Partial Content");
    assert(HttpStatus.multiStatus.toString == "Multi Status");
    assert(HttpStatus.alreadyReported.toString == "Already Reported");
    assert(HttpStatus.imUsed.toString == "IM Used");
    assert(HttpStatus.multipleChoices.toString == "Multiple Choices");
    assert(HttpStatus.movedPermanently.toString == "Moved Permanently");
    assert(HttpStatus.found.toString == "Found");
    assert(HttpStatus.seeOther.toString == "See Other");
    assert(HttpStatus.notModified.toString == "Not Modified");
    assert(HttpStatus.useProxyDeprecated.toString == "Use Proxy Deprecated");
    assert(HttpStatus.unused.toString == "Unused");
    assert(HttpStatus.temporaryRedirect.toString == "Temporary Redirect");
    assert(HttpStatus.permanentRedirect.toString == "Permanent Redirect");
    assert(HttpStatus.badRequest.toString == "Bad Request");
    assert(HttpStatus.unauthorized.toString == "Unauthorized");
    assert(HttpStatus.paymentRequiredExperimental.toString == "Payment Required Experimental");
    assert(HttpStatus.forbidden.toString == "Forbidden");
    assert(HttpStatus.notFound.toString == "Not Found");
    assert(HttpStatus.methodNotAllowed.toString == "Method Not Allowed");
    assert(HttpStatus.notAcceptable.toString == "Not Acceptable");
    assert(HttpStatus.proxyAuthenticationRequired.toString == "Proxy Authentication Required");
    assert(HttpStatus.requestTimeout.toString == "Request Timeout");
    assert(HttpStatus.conflict.toString == "Conflict");
    assert(HttpStatus.gone.toString == "Gone");
    assert(HttpStatus.lengthRequired.toString == "Length Required");
    assert(HttpStatus.preconditionFailed.toString == "Precondition Failed");
    assert(HttpStatus.payloadTooLarge.toString == "Payload Too Large");
    assert(HttpStatus.uriTooLong.toString == "URI Too Long");
    assert(HttpStatus.unsupportedMediaType.toString == "Unsupported Media Type");
    assert(HttpStatus.rangeNotSatisfiable.toString == "Range Not Satisfiable");
    assert(HttpStatus.expectationFailed.toString == "Expectation Failed");
    assert(HttpStatus.iAmATeapot.toString == "I'm a teapot");
    assert(HttpStatus.misdirectedRequest.toString == "Misdirected Request");
    assert(HttpStatus.unprocessableContent.toString == "Unprocessable Content");
    assert(HttpStatus.locked.toString == "Locked");
    assert(HttpStatus.failedDependency.toString == "Failed Dependency");
    assert(HttpStatus.tooEarlyExperimental.toString == "Too Early Experimental");
    assert(HttpStatus.upgradeRequired.toString == "Upgrade Required");
    assert(HttpStatus.preconditionRequired.toString == "Precondition Required");
    assert(HttpStatus.tooManyRequests.toString == "Too Many Requests");
    assert(HttpStatus.requestHeaderFieldsTooLarge.toString == "Request Header Fields Too Large");
    assert(HttpStatus.unavailableForLegalReasons.toString == "Unavailable For Legal Reasons");
    assert(HttpStatus.internalServerError.toString == "Internal Server Error");
    assert(HttpStatus.notImplemented.toString == "Not Implemented");
    assert(HttpStatus.badGateway.toString == "Bad Gateway");
    assert(HttpStatus.serviceUnavailable.toString == "Service Unavailable");
    assert(HttpStatus.gatewayTimeout.toString == "Gateway Timeout");
    assert(HttpStatus.httpVersionNotSupported.toString == "HTTP Version Not Supported");
    assert(HttpStatus.variantAlsoNegotiates.toString == "Variant Also Negotiates");
    assert(HttpStatus.insufficientStorage.toString == "Insufficient Storage");
    assert(HttpStatus.loopDetected.toString == "Loop Detected");
    assert(HttpStatus.notExtended.toString == "Not Extended");
    assert(HttpStatus.networkAuthenticationRequired.toString == "Network Authentication Required");
}
