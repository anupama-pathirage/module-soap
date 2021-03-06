// Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Object for SOAP 1.2 client endpoint.
#
# + soap12Client - Http client created to send SOAP 1.2 requests.
public type Soap12Client client object {

    private http:Client soap12Client;

    public function __init(string url, SoapConfiguration? soapConfig = ()) {
        self.soap12Client = new(url, config = soapConfig.clientConfig);
    }

    # Sends SOAP 1.2 request and expects a response.
    #
    # + path - Resource path
    # + soapAction - SOAP action
    # + body - SOAP payload
    # + options - SOAP options. Ex: Headers, Ws-addressing parameters, usernameToken parameters
    # + return - If a success, returns the response object, else returns `SoapError` object
    public remote function sendReceive(string path, string? soapAction = (), xml body, Options? options = ())
        returns SoapResponse|error {
        return sendReceive(path, soapAction = soapAction, body, options = options, self.soap12Client, SOAP12);
    }

    # Send Robust SOAP 1.2 requests.Sends the request and possibly receives an error.
    #
    # + path - Resource path
    # + soapAction - SOAP action
    # + options - SOAP options. Ex: Headers, Ws-addressing parameters, usernameToken parameters
    # + return - If a success, returns `nil`, else returns `SoapError` object
    public remote function sendRobust(string path, string? soapAction = (), xml body, Options? options = ())
            returns error? {
        return sendRobust(path, soapAction = soapAction, body, options = options, self.soap12Client, SOAP12);
    }

    # Fire and forget requests. Sends the request without the possibility of any response from the
    # service(even an error).
    #
    # + path - Resource path
    # + soapAction - SOAP action
    # + options - SOAP options. Ex: Headers, Ws-addressing parameters, usernameToken parameters
    public remote function fireAndForget(string path, string? soapAction = (), xml body, Options? options = ()) {
        fireAndForget(path, soapAction = soapAction, body, options = options, self.soap12Client, SOAP12);
    }
};
