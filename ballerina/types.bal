// Copyright (c) 2025 WSO2 LLC (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
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

# Represents a request message for the chat service.
#
# + sessionId - A unique identifier for the chat session.
# + message - The content of the chat message sent by the user.
public type ChatReqMessage record {|
    string sessionId;
    string message;
|};

# Represents a response message from the chat service.
#
# + message - The response message generated by the chat service.
public type ChatRespMessage record {|
    string message;
|};

# Represents the configuration for a chat client.
public type ChatClientConfiguration record {|
    *http:ClientConfiguration;
|};

# Defines a chat service interface that handles incoming chat messages.
public type ChatService distinct service object {
    *http:Service;
    resource function post chat(@http:Payload ChatReqMessage request) returns ChatRespMessage|error;
};
